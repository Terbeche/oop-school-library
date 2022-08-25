require_relative './app'
APP = App.new
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
def main()
  choice = menu

  case choice
  when 1
    APP.display_books
    main
  when 2
    APP.display_people
    main
  when 3
    create_person
    main
  when 4
    create_book
    main
  when 5
    create_rental
    main
  when 6
    display_rentals
    main
  when 7
    puts 'Thank you for using this app'
    exit
  end
end

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  type = gets.chomp.to_i
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  case type
  when 1
    type = 'student'
    print 'Parent permission? [Y/N]: '
    parent_permission = gets.chomp
    if %w[y Y].include?(parent_permission)
      parent_permission = true
    elsif %w[n N].include?(parent_permission)
      parent_permission == false
    end
    APP.create_person(type, age, name, parent_permission)

  when 2
    type = 'teacher'
    print 'Specialization: '
    specialization = gets.chomp
    APP.create_person(type, age, name, nil, specialization)

  else
    puts "You haven't enter a right choice!"
  end
  puts 'Person created successfully'
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  APP.create_book(title, author)
  puts 'Book created successfully'
end

def create_rental
  puts 'Select a book from the following list by number'
  APP.display_books
  book = gets.chomp.to_i
  puts 'Select a person from the following list by number(not id)'
  APP.display_people
  person = gets.chomp.to_i
  print 'Date: '
  date = gets.chomp

  book = APP.books[book]
  person = APP.persons[person]

  APP.create_rental(date, person, book)
  puts 'Rental created successfully'
end

def display_rentals
  puts 'Id of person: '
  id = gets.chomp.to_i

  our_person = APP.persons.select { |person| person.id == id }.first
  rentals = our_person.rentals

  if rentals.nil?
    puts 'There is no rentals with this ID'
  else
    APP.display_rentals(rentals)
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

  gets.chomp.to_i
end

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
main
