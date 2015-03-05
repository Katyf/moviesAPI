class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :total_gross, :release_date, :MPAA_rating, :description, :created_at

  def created_at
    object.created_at.strftime('%d-%m-%Y')
  end

end
