class ImageProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo

  def photo
    object.photo.url
  end
end
