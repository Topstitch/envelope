class Household < ApplicationRecord
  has_many :addresses, dependent:destroy
  has_many :contacts
end
