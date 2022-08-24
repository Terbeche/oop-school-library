class Rental
  attr_accessor :data
  attr_reader :person, :book

  def initialize(data, person, book)
    @data = data

    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end
end
