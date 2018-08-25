class Contact < ApplicationRecord
  belongs_to :household, optional: true
  has_many :contacts_labels
  has_many :labels, through: :contacts_labels
  has_many :contacts_lists
  has_many :lists, through: :contacts_lists
  # from correspondences
  # to correspondences
  # all correspondences
end
