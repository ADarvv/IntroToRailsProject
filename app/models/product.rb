class Product < ApplicationRecord
  belongs_to :category
  
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates :current_price, presence: true, numericality: { greater_than: 0, less_than: 1000 }
  validates :stock_quantity, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10000 }
  validates :sku, presence: true, uniqueness: true, format: { with: /\A[A-Z0-9]{3,10}\z/ }
  validates :is_active, inclusion: { in: [true, false] }
  
  scope :active, -> { where(is_active: true) }
end