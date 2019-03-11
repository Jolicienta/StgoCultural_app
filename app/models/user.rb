class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hosted_events, foreign_key: "user_id", class_name: "Event"
  # has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
end
