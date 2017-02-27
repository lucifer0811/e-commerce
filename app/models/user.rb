class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  ATTRIBUTES_PARAMS = [:name, :email, :password, :password_confirmation,
    :avatar, :birthday, :address, :phone_number]

  validates :phone_number, presence: true, length: {minimum: 10, maximum: 11}
  mount_base64_uploader :avatar, PhotoUploader
end
