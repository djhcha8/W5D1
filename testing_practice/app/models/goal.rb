class Goal < ApplicationRecord
  validates :body, presence: true
  validates :user_id, presence: true
  validates :private, presence: true
  validates :completed, presence: true

  belongs_to :user
end
