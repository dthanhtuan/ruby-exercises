# This sample Ruby app demonstrates the Command design pattern to manage a list of tasks.
# Each action (adding or removing a task) is encapsulated as a command object, supporting both execution and reversal (undo).
# The CommandInvoker tracks executed commands for undo functionality and uses a separate stack to enable redo,
# allowing you to revert and reapply changes dynamically

# Receiver
class TaskManager
  attr_reader :tasks

  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

  def remove_task(task)
    @tasks.delete(task)
  end
end

# Command interface
class Command
  def execute; end
  def undo; end
end

# ConcreteCommand để thêm task
class AddTaskCommand < Command
  def initialize(manager, task)
    @manager = manager
    @task = task
  end

  def execute
    @manager.add_task(@task)
    puts "Added task: #{@task}"
  end

  def undo
    @manager.remove_task(@task)
    puts "Undo add task: #{@task}"
  end
end

# ConcreteCommand để xoá task
class RemoveTaskCommand < Command
  def initialize(manager, task)
    @manager = manager
    @task = task
  end

  def execute
    @manager.remove_task(@task)
    puts "Removed task: #{@task}"
  end

  def undo
    @manager.add_task(@task)
    puts "Undo remove task: #{@task}"
  end
end

# Invoker quản lý Undo và Redo stack
class CommandInvoker
  def initialize
    @undo_stack = []
    @redo_stack = []
  end

  def execute(command)
    command.execute
    @undo_stack.push(command)
    @redo_stack.clear   # Thực hiện lệnh mới sẽ xoá redo stack
  end

  def undo
    command = @undo_stack.pop
    if command
      command.undo
      @redo_stack.push(command)
    else
      puts "Nothing to undo"
    end
  end

  def redo
    command = @redo_stack.pop
    if command
      command.execute
      @undo_stack.push(command)
    else
      puts "Nothing to redo"
    end
  end
end

# Client sử dụng:
manager = TaskManager.new
invoker = CommandInvoker.new

add_cmd = AddTaskCommand.new(manager, "Learn Ruby")
remove_cmd = RemoveTaskCommand.new(manager, "Learn Ruby")

invoker.execute(add_cmd)    # Added task: Learn Ruby
invoker.execute(remove_cmd) # Removed task: Learn Ruby

invoker.undo               # Undo remove task: Learn Ruby
invoker.undo               # Undo add task: Learn Ruby

invoker.redo               # Added task: Learn Ruby
invoker.redo               # Removed task: Learn Ruby

invoker.redo               # Nothing to redo
