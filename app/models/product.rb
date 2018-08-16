class Product < ApplicationRecord
  belongs_to :category
  belongs_to :manufacture
  has_many :comments
  # has_many :rates
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :picture, presence: true
  # mount_uploader :picture, PictureUploader

  ratyrate_rateable "quality"

  scope :search, ->(product){where "name LIKE ?", "%#{product}%"}
  scope :sort_by_name, ->{order name: :desc}
end
