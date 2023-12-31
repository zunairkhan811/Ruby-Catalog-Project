require_relative 'book'
require_relative 'label'
require 'json'

class ListBook
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def add_book
    puts 'Enter the book you want to add: '
    title = gets.chomp
    puts 'Enter the color of the book: '
    color = gets.chomp
    puts 'Enter the publish date of the book(Year-MM-DD): '
    publish_date = gets.chomp
    puts 'Enter the publisher of the book: '
    publisher = gets.chomp
    puts 'Enter the cover state of the book: '
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    label = Label.new(title, color)
    @books.push(book)
    @labels.push(label)
    puts 'Book added'
    store_book(book)
    store_label(label)
  end

  def store_book(book)
    obj = {
      id: book.id,
      publisher: book.publisher,
      publish_date: book.publish_date,
      cover_state: book.cover_state
    }

    stored_book = if File.exist?('store/books.json') && !File.empty?('store/books.json')
                    JSON.parse(File.read('store/books.json'))
                  else
                    []
                  end

    stored_book << obj
    File.write('store/books.json', stored_book.to_json)
  end

  def store_label(label)
    obj = {
      id: label.id,
      title: label.title,
      color: label.color
    }

    stored_label = if File.exist?('store/labels.json') && !File.empty?('store/labels.json')
                     JSON.parse(File.read('store/labels.json'))
                   else
                     []
                   end

    stored_label << obj
    File.write('store/labels.json', stored_label.to_json)
  end

  def list_all_books
    if File.exist?('store/books.json')
      @books = JSON.parse(File.read('store/books.json'))
      @books.each do |book|
        puts "Publish date: #{book['publish_date']}, " \
             "Publisher: #{book['publisher']}, " \
             "Cover state: #{book['cover_state']}"
      end
    else
      puts "The books file doesn't exist or is empty."
    end
  end

  def list_all_labels
    if File.exist?('store/labels.json') && !File.empty?('store/labels.json')
      @labels = JSON.parse(File.read('store/labels.json'))
      @labels.each do |label|
        puts "Title: #{label['title']}, Color: #{label['color']}"
      end
    else
      puts "The labels file doesn't exist or is empty."
    end
  end
end
