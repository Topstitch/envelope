class Household < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :contacts
  has_many :correspondences_from, -> { where from_type: "Household" }, class_name: Correspondence, foreign_key: :from_id, foreign_type: :from_type
  has_many :correspondences_to, -> { where to_type: "Household" }, class_name: Correspondence, foreign_key: :to_id, foreign_type: :to_type

  def correspondences
    Correspondence.where("(from_type = 'Household' AND from_id = #{self.id}) OR (to_type = 'Household' AND to_id = #{self.id})")
  end
end
