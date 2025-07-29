# Context class
class Article
  attr_accessor :state

  def initialize
    # Start in Draft state
    @state = DraftState.new(self)
  end

  # Delegate behavior to the current state
  def publish
    @state.publish
  end

  def review
    @state.review
  end

  def retract
    @state.retract
  end

  def status
    @state.to_s
  end
end

# Base State class
class State
  attr_reader :article

  def initialize(article)
    @article = article
  end

  def publish
    raise NotImplementedError, 'Subclasses must implement publish'
  end

  def review
    raise NotImplementedError, 'Subclasses must implement review'
  end

  def retract
    raise NotImplementedError, 'Subclasses must implement retract'
  end
end

# Concrete State: Draft
class DraftState < State
  def publish
    puts "Can't publish article in Draft state. Send it for review first."
  end

  def review
    puts "Article sent for review."
    article.state = ReviewState.new(article)
  end

  def retract
    puts "Article is already in Draft state."
  end

  def to_s
    "Draft"
  end
end

# Concrete State: Review
class ReviewState < State
  def publish
    puts "Article approved and published."
    article.state = PublicState.new(article)
  end

  def review
    puts "Article is already under review."
  end

  def retract
    puts "Article retracted back to Draft."
    article.state = DraftState.new(article)
  end

  def to_s
    "Review"
  end
end

# Concrete State: Public
class PublicState < State
  def publish
    puts "Article is already published."
  end

  def review
    puts "Article is already published, can't send for review."
  end

  def retract
    puts "Article retracted back to Draft."
    article.state = DraftState.new(article)
  end

  def to_s
    "Public"
  end
end

# Usage example
article = Article.new
puts article.status # => Draft

article.publish # Can't publish article in Draft state. Send it for review first.
article.review # Article sent for review.
puts article.status # => Review

article.publish # Article approved and published.
puts article.status # => Public

article.review # Article is already published, can't send for review.
article.retract # Article retracted back to Draft.
puts article.status # => Draft
