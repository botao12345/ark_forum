class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :responses
  mount_uploader :photo, PictureUploader
  validates :title, presence: true
  validates :message, length: {maximum: 1400,
                               too_long: "Message is too long."}
end
