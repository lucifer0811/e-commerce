class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_authentication_token!

  validates :auth_token, uniqueness: true
  validates :name, presence: true, length: {maximum: 50}
  # validates :address, presence: true
  validates :phone_number, length: {minimum: 10, maximum: 11}
  mount_base64_uploader :avatar, PhotoUploader

  has_many :orders, dependent: :destroy

  ATTRIBUTES_PARAMS = [:name, :email, :password, :password_confirmation,
    :avatar, :birthday, :address, :phone_number]

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists? auth_token: auth_token
  end
end
