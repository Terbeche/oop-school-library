require_relative 'nameable'
class Person < Nameable
  # attr_reader :id, :rentals
  # attr_accessor :name, :age

  attr_reader :id
  attr_accessor :age, :name, :rentals, :parent_permission

  def initialize(age, _id, name = 'Unknown', parent_permission: true)
    super()
    @id = rand 1000
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  def correct_name
    @name
  end

  # def add_rental(rental)
  #   @rentals.push(rental)
  # end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end
end
