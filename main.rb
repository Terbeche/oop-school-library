require './app'

def main()
  app = App.new

  # menu

  choice get.chomp

  case choice
  when 1
    app.display_books
  when 2
    app.display_people
  when 3
    create_person

  when 4
    create_book

  when 5
    creat_rental
  when 6
    display_rentals

  when 7
    puts 'Thank you for using this app'
    exit
  end
end

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  type = gets.chomp
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  case type
  when 1
    type = 'student'
    print 'Parent permission? [Y/N]: '
    parent_permission = gets.chomp
  when 2
    type = 'teacher'
    print 'Specialization '
    specialization = gets.chomp
  else
    puts "You haven't enter a right choice!"
  end
  app.create_person(age, name, parent_permission, type, specialization)
  puts 'Person created successfully'
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.create_book(title, author)
  puts 'Bok created successfully'
end

def creat_rental
  puts 'Select a book from the following list by number'
  app.display_books
  book = gets.chomp
  puts 'Select a person from the following list by number(not id)'
  app.display_people
  person = gets.chomp
  print 'Date: '
  date = gets.chomp
  app.create_rental(date, person, book)
  puts 'Rental created successfully'
end

def display_rentals
  puts 'Id of person: '
  id = gets.chomp

  our_person = app.persons.select { |person| person.id == id }.first
  rentals = our_person.rentals

  if rentals.nil?
    puts 'There is no rentals with this ID'
  else
    app.display_rentals(rentals)
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
  puts 'Exit'
end
main
