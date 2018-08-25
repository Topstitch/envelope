class List < ApplicationRecord
  has_many :correspondences
  has_many :contacts_lists, dependent: :destroy
  has_many :contacts, through: :contacts_lists
end
