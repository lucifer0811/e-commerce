class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :avatar, :birthday, :phone_number, :address,
    :auth_token

  def avatar
    object.avatar.url
  end

  def birthday
    if object.birthday.present?
      object.birthday.to_date
    else
      object.birthday
    end
  end
end
