class Correspondence < ApplicationRecord
  belongs_to :list, optional: true
  has_many :correspondences_labels
  has_many :labels, through: :correspondences_labels
  belongs_to :from, polymorphic: true
  
  # join with contacts to
  # join with contacts
  
  # join with households to
  # join with households
end
