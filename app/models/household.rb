class Household < ApplicationRecord
  has_many :addresses
  has_many :contacts
end
