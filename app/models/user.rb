class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets
  has_many :responses

  mount_uploader :photo, AttachmentUploader

  serialize :following, Array

  validates :username, presence: true
  validates :username, uniqueness: true


end

