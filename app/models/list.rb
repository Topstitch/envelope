class List < ApplicationRecord
  has_many :correspondences
  has_many :contacts_lists
  has_many :contacts, through: :contacts_lists
end
