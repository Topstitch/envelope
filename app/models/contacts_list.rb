class ContactsList < ApplicationRecord
  belongs_to :contact
  belongs_to :list
end
