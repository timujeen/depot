class LineItem < ActiveRecord::Base
  attr_accessible :cart, :product, :cart_id, :product_id, :quantity, :price
  belongs_to :cart
  belongs_to :product
  belongs_to :order

  def total_price
  	product.price * quantity
  end
end
