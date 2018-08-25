class Household < ApplicationRecord
  has_many :addresses
  has_many :contacts
  has_many :correspondences_from, -> { where from_type: "Household"}, class_name: Correspondence, foreign_key: :from_id, foreign_type: :from_type
  has_many :correspondences_to, -> { where to_type: "Household"}, class_name: Correspondence, foreign_key: :to_id, foreign_type: :to_type
  # all correspondences
end
