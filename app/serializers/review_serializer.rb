class ReviewSerializer < ActiveModel::Serializer
  attributes :author, :body, :rating
end
