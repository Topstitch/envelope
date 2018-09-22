class Correspondence < ApplicationRecord
  belongs_to :list, optional: true
  has_and_belongs_to_many :labels
  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true

  FA_ICON = 'paper-plane-o'.freeze
  CATEGORIES = %w[card letter postcard gift package email ecard].freeze
  STATUSES = %w[initial complete].freeze

  validates :from_id, :to_id, :from_type, :to_type, :category, :status, presence: true
  validates :from_type, :to_type, inclusion: { in: %w[Contact Household] }
  validates :category, inclusion: { in: CATEGORIES }
  validates :status, inclusion: { in: STATUSES }

  acts_as_paranoid

  def display_info
    "#{category.upcase} from: #{from.display_name}, to: #{to.display_name}"
  end

  def self.fa_icon_string
    FA_ICON
  end
end
