require './person'
require './book'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @persons = []
    @teachers = []
    @students = []
    @rantals = []
  end

  def display_books
    books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def display_people
    persons.each do |person|
      type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "[#{type}] Name: #{person.name}, ID: #{person.id}, Age #{person.age}"
    end
  end

  def create_person(age, name, parent_permission, type, _specialization = nil)
    case type
    when 'student'
      student = Student.new(age, name, parent_permission)
      @persons.push(student)
      @students.push(student)

    when 'teacher'
      teacher = Teacher.new(age, name, parent_permission)
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
