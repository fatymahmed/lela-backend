class List < ApplicationRecord
  has_many :items
  accepts_nested_attributes_for :items,
                                reject_if: ->(attributes) { attributes['name'].blank? }, allow_destroy: true
end
