class Correspondence < ApplicationRecord
  belongs_to :list, optional: true
  has_many :correspondences_labels, dependent: :destroy
  has_many :labels, through: :correspondences_labels
  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true
end
