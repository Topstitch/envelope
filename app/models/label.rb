class Label < ApplicationRecord
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :correspondences

  validates :name, presence: true, uniqueness: true

  acts_as_paranoid

  FA_ICON = 'tag'.freeze

  def self.fa_icon_string
    FA_ICON
  end
end
