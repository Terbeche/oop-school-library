require 'json'

module PersistRental
  def store_Rentals(rentals)
    rentalArray = []
    file = './json_files/rentals.json'
    return unless File.exist?(file)

    rentals.each do |rental|
      rentalArray << { date: rental.date, book: rental.book, person: rental.person }
    end
    File.write(file, JSON.generate(rentalArray))
  end

  def fetch_rentals
    rentalArray = []
    file = './json_files/rentals.json'
    return rentalArray unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |rental|
     rentalArray << Rental.new(rental['date'], rental['author'], rental['person'])
    end

    rentalArray
  end
end
