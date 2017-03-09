class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  before_save {email.downcase!}
  before_create :generate_authentication_token!

  validates :auth_token, uniqueness: true
  validates :name, presence: true, length: {maximum: 50}
  validates :phone_number, length: {minimum: 10, maximum: 11}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {scope: :uid, case_sensitive: false}

  mount_base64_uploader :avatar, PhotoUploader

  ATTRIBUTES_PARAMS = [:name, :email, :password, :password_confirmation,
    :avatar, :birthday, :address, :phone_number]

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists? auth_token: auth_token
  end
end
