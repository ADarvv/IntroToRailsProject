class Product < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :current_price, presence: true, numericality: { greater_than: 0 }
  validates :stock_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  scope :active, -> { where(is_active: true) }
end