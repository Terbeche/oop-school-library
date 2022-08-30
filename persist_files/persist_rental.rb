require 'json'

module PersistRental
  def store_rentals(rentals)
    rental_array = []
    file = './json_files/rentals.json'
    return unless File.exist?(file)

    rentals.each do |rental|
      rentalArray << { date: rental.date, book: rental.book, person: rental.person }
    end
    File.write(file, JSON.generate(rental_array))
  end

  def fetch_rentals
    rental_array = []
    file = './json_files/rentals.json'
    return rental_array unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |rental|
      rental_array << Rental.new(rental['date'], rental['author'], rental['person'])
    end

    rental_array
  end
end
