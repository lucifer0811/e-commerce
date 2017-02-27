class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_authentication_token!

  validates :phone_number, presence: true, length: {minimum: 10, maximum: 11}
  mount_base64_uploader :avatar, PhotoUploader

  ATTRIBUTES_PARAMS = [:name, :email, :password, :password_confirmation,
    :avatar, :birthday, :address, :phone_number]

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists? auth_token: auth_token
  end
end
