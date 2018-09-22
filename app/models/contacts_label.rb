class ContactsLabel < ApplicationRecord
  belongs_to :contact
  belongs_to :label
end
