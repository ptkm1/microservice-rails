class Client < ApplicationRecord
  belongs_to :user
  validates :name, :user, presence: true 
  # presence: true, is for set a necessary values of user and name
end
