class Label < ApplicationRecord
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :correspondences
end
