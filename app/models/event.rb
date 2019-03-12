class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, dependent: :destroy
end
