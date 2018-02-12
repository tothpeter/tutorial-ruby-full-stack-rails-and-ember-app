class Offer < ApplicationRecord
  enum status: [ :active, :accepted, :rejected, :expired ]

  validates_presence_of :name

  belongs_to :project
  has_and_belongs_to_many :contacts
  has_many :tasks
end
