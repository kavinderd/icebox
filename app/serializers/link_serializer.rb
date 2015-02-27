class LinkSerializer < ActiveModel::Serializer
  attributes :id, :url, :title
  has_one :user
end
