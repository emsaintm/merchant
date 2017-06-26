class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  # if we destroy the order, we'll also destroy the line items.  or won't destroy an order if it has line items associated with it.  direct relationship b/t order and line items.
  belongs_to :user

  validates :name, :address, :user_id, presence: true


  PAYMENT_TYPES = ["Cash", "Check", "Paypal", "COD", "Wampum", "BitCoin"]

  validates :pay_type, presence: true, inclusion: PAYMENT_TYPES


def add_line_items_from_cart(cart)
  cart.line_items.each do |item|
    item.cart_id = nil
    line_items << item 
    

  end

end

end

# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :text
#  pay_type   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
