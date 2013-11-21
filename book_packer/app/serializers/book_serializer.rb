class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :price, :isbn10, :shipping_weight
end
