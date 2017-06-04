DATA_PATH = 'data.yaml'

require './Library/library'
require 'yaml'

puts 'Welcome'

data = YAML::load(File.open(DATA_PATH))

library = Library.new(
    authors: data.authors,
    books: data.books,
    orders: data.orders,
    readers: data.readers
  )

puts "Your options:"
puts "help - Options"
puts "1 - Who often takes the book"
puts "2 - What is the most popular book"
puts "3 - How many people ordered one of the three most popular books"
puts "4 - Show All Orders"
puts "5 - Show All Books"
puts "6 - Show All Readers"
puts "7 - Show All Authors"
puts "10 - Exit"

loop do
  input = gets.chomp
  command, *params = input.split /\s/

  case command
  when /\Ahelp\z/i
    puts "Your options:"
    puts "help - Options"
    puts "1 - Who often takes the book"
    puts "2 - What is the most popular book"
    puts "3 - How many people ordered one of the three most popular books"
    puts "4 - Show All Orders"
    puts "5 - Show All Books"
    puts "6 - Show All Readers"
    puts "7 - Show All Authors"
    puts "10 - Exit"
  when /\A1\z/i
    puts '**'
    puts "Top Reader:"
    puts library.top_reader
  when /\A2\z/i
    puts '**'
    puts "Top Reader:"
    puts library.top_book
  when /\A3\z/i
    puts '**'
    puts "Top Reader:"
    puts library.top_book_readers
  when /\A4\z/i
    puts '**'
    puts "All Orders:"
    puts library.orders
  when /\A5\z/i
    puts '**'
    puts "All Books:"
    puts library.books
  when /\A6\z/i
    puts '**'
    puts "All Authors:"
    puts library.authors
  when /\A7\z/i
    puts '**'
    puts "All Readers:"
    puts library.readers
  when /\A10\z/i
    break
  else puts 'Invalid command (help to see all options)'
  end
end
