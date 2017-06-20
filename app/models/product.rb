class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category


  validates :name, presence: true, length: {minimum: 2}
  validates_uniqueness_of :name, scope: :brand_id
  validates :price, numericality: true 
  validates :quantity, numericality: {only_integer: true}
  validates :description, presence: true
  validates :brand, :category, presence: true
  
  # validates :brand_id, presence: true
  # validates :category_id, presence: true
  # don't necessarily need these b/c of above "belongs_to"


  has_attached_file :avatar, styles: { medium: '300x300', thumb: '100x100>'}, default_url: "missing_:style.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end

# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  price               :decimal(, )
#  quantity            :integer
#  description         :text
#  brand_id            :integer
#  category_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#
# Indexes
#
#  index_products_on_brand_id     (brand_id)
#  index_products_on_category_id  (category_id)
#
