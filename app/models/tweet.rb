class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :responses
  mount_uploader :photo, PictureUploader
  validates :message, presence: true
  validates :title, presence: true
  validates :message, length: {maximum: 140,
                               too_long: "Message is too long."}
end
