class Project < ApplicationRecord
  enum status: [ :active, :archived ]

  validates_presence_of :name

  has_and_belongs_to_many :contacts
  has_many :tasks
  has_many :offers
end
