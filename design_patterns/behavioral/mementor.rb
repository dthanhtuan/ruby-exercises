# Memento class stores all the attributes (state) of the Originator that are necessary to completely capture its current state.
# This snapshot of state is then used later to restore the Originator exactly to that prior state.
## The Memento has fields corresponding to the relevant internal attributes of the Originator.
## The Originator knows how to create a Memento by passing its own state attributes into the Memento’s constructor.
## The Originator also knows how to restore itself by reading those attributes from the Memento.
## The Caretaker only holds Mementos without accessing or modifying their internal data.


# Memento class: stores the state of a browser page (URL, scroll position, form data, etc.)
class PageMemento
  attr_reader :url, :scroll_position, :form_data

  def initialize(url, scroll_position, form_data)
    @url = url.freeze
    @scroll_position = scroll_position.freeze
    @form_data = form_data.freeze
  end
end

# Originator class: Browser tab/session whose state we save and restore
class BrowserTab
  attr_accessor :url, :scroll_position, :form_data

  def initialize
    @url = "about:blank"
    @scroll_position = 0
    @form_data = {}
  end

  # Create a snapshot of current state
  def save
    PageMemento.new(@url.dup, @scroll_position, @form_data.dup)
  end

  # Restore state from a memento
  def restore(memento)
    @url = memento.url.dup
    @scroll_position = memento.scroll_position
    @form_data = memento.form_data.dup
  end

  def to_s
    "URL: #{@url}, Scroll: #{@scroll_position}, Form Data: #{@form_data}"
  end
end

# Caretaker class: manages history stack and current position for back/forward
class BrowserHistory
  def initialize
    @history = []
    @current = -1
  end

  # Save current page snapshot, clear future history
  def push(state)
    # If new page visited after going back, clear forward history
    @history = @history[0..@current]
    @history << state
    @current += 1
  end

  # Go back in history and return previous memento state
  def back
    return nil if @current <= 0

    @current -= 1
    @history[@current]
  end

  # Go forward in history and return next memento state
  def forward
    return nil if @current >= @history.size - 1

    @current += 1
    @history[@current]
  end
end

# Usage example demonstrating browser navigation
tab = BrowserTab.new
history = BrowserHistory.new

# User visits first page
tab.url = "https://example.com"
tab.scroll_position = 100
tab.form_data = {search: "design patterns"}
history.push(tab.save)
puts tab

# User visits second page
tab.url = "https://example.com/articles"
tab.scroll_position = 250
tab.form_data = {}
history.push(tab.save)
puts tab

# User presses back button in browser
previous_state = history.back
tab.restore(previous_state) if previous_state
puts "Back: #{tab}"

# User presses forward button in browser
next_state = history.forward
tab.restore(next_state) if next_state
puts "Forward: #{tab}"
