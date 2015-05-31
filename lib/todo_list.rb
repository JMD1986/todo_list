require_relative "../db/setup.rb"
require_relative "todo"
class TodoList

  def start
    loop do
      @todos = Todo.all
      system('clear')
      puts "
      +--------------------------------------------------------------------+
      |                             TODO LIST                              |
      +--------------------------------------------------------------------+"
      view_todos

      puts
      puts "What would you like to do?"
      puts
      puts "1) Exit 2) Add Todo 3) Mark Todo As Complete 4) Remove Todo 5) Edit Todo"
      print " > "
      action = gets.chomp.to_i
      case action
      when 1 then exit
      when 2 then add_todo
      when 3 then mark_todo
      when 4 then destroy_todo
      when 5 then edit_todo
      else
        puts "\a"
        puts "Not a valid choice"
      end
    end
  end

  def add_todo
    puts "What would you like to add to your todo list?"
    Todo.create(entry: get_input)
  end

  def mark_todo
    puts "which todo have you done?
      (please pick id number)"
    Todo.update(get_input, completed: true)
  end

  def view_todos
    @todos.each do |item|
      puts
      puts "#{item.id} | #{item.entry} | #{item.completed}"
    end
  end

  def destroy_todo
    puts "which todo would you like to remove?
      (please pick id number)"
    Todo.destroy(get_input)
  end

 def edit_todo
    puts
    "which todo would you like to edit? (please pick id number)"
      edit_todo = get_input
    puts "what would you like it to say now?"
    Todo.update(edit_todo, entry: get_input)
  end

  private
  def get_input
    gets.chomp
  end
end

TodoList.new.start
