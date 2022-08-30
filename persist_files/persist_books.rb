require 'json'

module PersistBooks
  def store_books(books)
    books_array = []
    file = './json_files/books.json'
    return unless File.exist?(file)

    books.each do |book|
      books_array << { title: book.title, author: book.author }
    end
    File.write(file, JSON.generate(books_array))
  end

  def fetch_books
    books_array = []
    file = './json_files/books.json'
    return books_array unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |book|
      books_array << Book.new(book['title'], book['author'])
    end

    books_array
  end
end
