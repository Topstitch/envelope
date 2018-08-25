class Correspondence < ApplicationRecord
  belongs_to :list, optional: true
  has_and_belongs_to_many :labels
  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true
end
