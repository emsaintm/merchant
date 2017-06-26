class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  # if we destroy the order, we'll also destroy the line items.  or won't destroy an order if it has line items associated with it.  direct relationship b/t order and line items.

  belongs_to :user


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
