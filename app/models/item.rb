class Item < ApplicationRecord
  has_many :collections
  has_many :lists, through: :collections
  validates :name, presence: true, uniqueness: true
end
