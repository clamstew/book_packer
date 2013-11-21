class Box
  attr :id, :content, :total_weight, :books, :weight_limit

  # Create New Box (ID, Weight, Box Contents)
  def add_new_box(id, weight)
    box = {"box" => {"id" => id, "total-weight" => weight, "box_contents" => [] }}
    @boxes << box
    box_books # @TODO Need to create box_books method
  end

#   # Look through each book adding their weight to a new array
  def book_weight_list(books)
    @book_weights = []
    @books.each do |book|
      @book_weights << book.shipping_weight
    end
    @boxes = []
    add_new_box(1,0)
  end

#   # Loop through each book weight and add to box is weight is less than 10 pounds
  def box_books
    @book_weights.each do |weight|
      if box_weight <= 10
        
      # @TODO NEED TO FINISH
  end
  # def intialize 
  #   @id = id
  #   @books = []
  # end

  # def weight_limit
  #   10
  # end
 
  # def total_weight
  #   @books.inject(0.0){|total, book| total += book.shipping_weight}
  # end

  # def add_book(book)
  #   @books << book
  # end

  # def can_add(book)
  #   if total_weight < weight_limit
  #     true
  #   else
  #     false
  #   end
  # end
end
