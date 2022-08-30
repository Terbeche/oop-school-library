require 'json'

def store_books(books)
    booksArray = []
    file = './json_files/books.json'
    return unless File.exist?(file)

    books.each do |book|
        booksArray << { title: book.title, author: book.author }
    end
    File.write(file, JSON.generate(booksArray))
end
