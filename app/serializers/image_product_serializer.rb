class ImageProductSerializer < ActiveModel::Serializer
  attributes :id, :photo

  def photo
    object.photo.url
  end
end
