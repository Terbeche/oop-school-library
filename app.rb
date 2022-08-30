require_relative './person'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './helper'

Helper = Helper.new
class App
  attr_reader :books, :persons
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end
  def display_books
    books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end
  def display_people
    persons.each_with_index do |person, index|
      type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "#{index})  [#{type}] Name: #{person.name}, ID: #{person.id}, Age #{person.age}"
    end
  end
  def create_person(type, age, name, parent_permission, specialization = nil)
    case type
    when 'student'
      student = Student.new(age, name, parent_permission)
      @persons.push(student)
    when 'teacher'
      teacher = Teacher.new(age, name, parent_permission, specialization)
      @persons.push(teacher)
    end
  end
  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end
  def create_rental(date, person, book)
    rental = Rental.new(date, person, book)
    @rentals.push(rental)
  end
  def display_rentals(rentals)
    rentals.each { |rental| puts "Date: #{rental.date}, Book #{rental.book.title}, by #{rental.book.author}" }
  end
  def check(choice)
    case choice
    when 1
      display_books
    when 2
      display_people
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
  def run
    choice = 0
  while choice != 7
    menu
    choice = gets.chomp.strip.to_i
    APP.check(choice)
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
end