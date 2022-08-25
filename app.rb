require_relative './person'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  attr_reader :books, :persons

  def initialize
    @books = []
    @persons = []
    @teachers = []
    @students = []
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
      @students.push(student)

    when 'teacher'
      teacher = Teacher.new(age, name, parent_permission, specialization)
      @persons.push(teacher)
      @teachers.push(teacher)
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
end
