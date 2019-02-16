class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :profile_photo, ProfilePhotoUploader
  validates_presence_of :email, :encrypted_password
  has_many :restaurants, dependent: :destroy
end
