desc 'Scrape Book Data'
task :scrape_book_data => :environment do 
  require 'nokogiri'

  Book.all.each do |book|
    page = Nokogiri::HTML(File.read("data/#{book.book_name}"))

    title = page.at_css("#btAsinTitle").text
    author = page.at_css(".buying span a").text
    price = page.at_css(".bb_price").text[/[0-9\.\S0-9]+/]
    shipping_weight = page.at_css("#productDetailsTable li:nth-child(7)").text[/[0-9\.]+/]   
    isbn10 = page.at_css("#productDetailsTable li:nth-child(4)").text

    book.update_attributes(title: title, author: author, price: price, shipping_weight: shipping_weight, isbn10: isbn10)

    end

    # Following updates books with different css selectors

    # Update Book 6
    book = Book.find_by_book_name("book6.html")
    book6 = Nokogiri::HTML(File.read("data/#{book.book_name}"))
    isbn10 = book6.at_css("#productDetailsTable li:nth-child(5)").text
    shipping_weight = book6.at_css("#productDetailsTable li:nth-child(8)").text[/[0-9\.]+/]

    book.update_attributes(isbn10: isbn10, shipping_weight: shipping_weight)

    # Updates Book 12
    book = Book.find_by_book_name("book12.html")
    book12 = Nokogiri::HTML(File.read("data/#{book.book_name}"))
    shipping_weight = book12.at_css('#productDetailsTable li:nth-child(8)').text[/[0-9\.]+/] 

    book.update_attributes(isbn10: isbn10, shipping_weight: shipping_weight)

    # Updates Book 20
    book = Book.find_by_book_name("book20.html")
    book20 = Nokogiri::HTML(File.read("data/#{book.book_name}"))
    shipping_weight = book20.at_css('#productDetailsTable li:nth-child(6)').text[/[0-9\.]+/] 

    book.update_attributes(shipping_weight: shipping_weight)

end