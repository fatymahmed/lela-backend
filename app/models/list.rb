class List < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :items, through: :collections
  # accepts_nested_attributes_for :items,
  #                               reject_if: ->(attributes) { attributes['name'].blank? }, allow_destroy: true
end
