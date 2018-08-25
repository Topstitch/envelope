class Label < ApplicationRecord
  has_many :contacts_labels
  has_many :contacts, through: :contacts_labels
  has_many :correspondences_labels
  has_many :correspondences, through: :correspondences_labels
end
