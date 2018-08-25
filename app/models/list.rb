class List < ApplicationRecord
  has_many :correspondences
  has_and_belongs_to_many :contacts

  validates :name, presence: true, uniqueness: true

  acts_as_paranoid
end
