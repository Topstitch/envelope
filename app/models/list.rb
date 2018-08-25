class List < ApplicationRecord
  has_many :correspondences
  has_and_belongs_to_many :contacts
end
