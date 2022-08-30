require 'json'

module PersistBooks
def store_books(books)
    booksArray = []
    file = './json_files/books.json'
    return unless File.exist?(file)
    
    books.each do |book|
        booksArray << { title: book.title, author: book.author }
    end
    File.write(file, JSON.generate(booksArray))

end

def fetch_books
    booksArray = []
    file = './json_files/books.json'
    return booksArray unless File.exist?(file) && File.read(file) != ''
    
    JSON.parse(File.read(file)).each do |book|
        booksArray << Book.new(book['title'], book['author'])
    end

    booksArray
end
end
