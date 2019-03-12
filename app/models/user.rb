class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hosted_events, foreign_key: "user_id", class_name: "Event"
  has_many :comments, dependent: :destroy

  has_many :favorites
  has_many :events, through: :favorites
end
