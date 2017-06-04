require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'

class Library
	attr_accessor :books, :orders, :readers, :authors
	def initialize(options = {})
		@books = options[:books]
		@orders = options[:orders]
		@readers = options[:readers]
		@authors = options[:authors]
	end

	def readers_orders(reader_name)
		@orders.select{ |o| o.reader.name == reader_name }
	end

	def books_orders(book_title)
		@orders.select{ |o| o.book.title == book_title }
	end

	def top_reader
		top_reader = Object.new
		orders_qty = 0
		@readers.each do |r|
			if readers_orders(r.name).size > orders_qty
				orders_qty = readers_orders(r.name).size
				top_reader = r
			end
		end
		top_reader
	end

	def top_book
		top_book = Object.new
		orders_qty = 0
		@books.each do |b|
			if books_orders(b.title).size > orders_qty
				orders_qty = books_orders(b.title).size
				top_book = b
			end
		end
		top_book
	end

	def top_book_readers
		top_book = self.top_book
		top_book_readers = []
		books_orders(top_book.title).each{ |o| top_book_readers << o.reader}
		top_book_readers
	end

end
