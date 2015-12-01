class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet
  validates :message, presence: true
end
