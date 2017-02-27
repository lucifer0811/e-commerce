class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :avatar, :birthday, :phone_number, :address,
    :auth_token

  def avatar
    object.avatar.url
  end
end
