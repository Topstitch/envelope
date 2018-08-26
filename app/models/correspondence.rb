class Correspondence < ApplicationRecord
  belongs_to :list, optional: true
  has_and_belongs_to_many :labels
  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true

  CATEGORIES = %w(card letter postcard gift package email ecard)
  STATUSES = %w(initial complete)

  validates :from_id, :to_id, :from_type, :to_type, :category, :status, presence: true
  validates :from_type, :to_type, inclusion: { in: %w(Contact Household) }
  validates :category, inclusion: { in: CATEGORIES }
  validates :status, inclusion: { in: STATUSES }

  acts_as_paranoid

  def display_info
    "#{category.upcase} from: #{from.display_name}, to: #{to.display_name}"
  end
end
