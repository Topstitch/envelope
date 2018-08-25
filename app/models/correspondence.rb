class Correspondence < ApplicationRecord
  belongs_to :list, optional: true
  has_many :correspondences_labels
  has_many :labels, through: :correspondences_labels
  # join with households from
  # join with households to
  # join with households
end
