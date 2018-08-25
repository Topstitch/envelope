class Household < ApplicationRecord
  has_many :addresses
  has_many :contacts
  has_many :correspondences, as: :from

  # to correspondences
  # all correspondences
end
