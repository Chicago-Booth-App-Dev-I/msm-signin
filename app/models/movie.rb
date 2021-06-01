# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord

validates(:title, :presence => true)

belongs_to(:director)
has_many(:characters)
has_many(:cast, :through => :characters, :source => :actor)

def bookmarked
to_check = self.id

list_of_bookmarks = Bookmark.where({:user_id => @current_user.id})

included_movie_ids = Array.new

list_of_bookmarks.each do |a_bookmark|
  included_movie_ids.push(a_bookmark.movie_id)
end

if to_check.in?(included_movie_ids)
  to_check.in?(included_movie_ids)
else
  to_check.in?(included_movie_ids)
end

end


end
