require_relative './app'
require_relative './helper'

APP = App.new
Helper = Helper.new

def main()
  choice = 0
  while choice != 7
    menu
    choice = gets.chomp.strip.to_i
    check(choice)
  end
end

def check(choice)
  case choice
  when 1
    APP.display_books

  when 2
    APP.display_people

  when 3
    Helper.create_person

  when 4
    Helper.create_book

  when 5
    Helper.create_rental

  when 6
    Helper.display_rentals
  else
    puts 'Thanks for using the Application!!'
  end
end

def menu
  puts 'Please chose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end
main
