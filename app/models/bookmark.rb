# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord

def movie
  bookmark_id = self.id
  the_movie = Movie.where(:id => bookmark_id).at(0)
  return the_movie
end

end
