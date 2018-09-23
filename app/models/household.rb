class Household < ApplicationRecord
  has_many :addresses, -> { order "verified_at DESC" }, dependent: :destroy
  has_many :contacts
  has_many :correspondences_from, -> { where from_type: "Household" }, class_name: Correspondence,
                                                                       foreign_key: :from_id,
                                                                       foreign_type: :from_type
  has_many :correspondences_to, -> { where to_type: "Household" }, class_name: Correspondence,
                                                                   foreign_key: :to_id,
                                                                   foreign_type: :to_type

  validates :name, presence: true

  acts_as_paranoid

  FA_ICON = 'home'.freeze

  def correspondences
    Correspondence.where("(from_type = 'Household' AND from_id = #{id}) OR (to_type = 'Household' AND to_id = #{id})")
  end

  def display_name
    "#{name} #{description}"
  end

  def verified_address
    potential_address = addresses.where.not(verified_at: nil).first
    (potential_address.blank? || potential_address.expired?) ? nil : potential_address 
  end

  # rubocop:disable Naming/PredicateName
  def has_verified_address?
    verified_address.present?
  end
  # rubocop:enable Naming/PredicateName

  def self.home
    Contact.me.household
  end

  def self.unverified
    all.reject(&:has_verified_address?)
  end

  def self.fa_icon_string
    FA_ICON
  end
end
