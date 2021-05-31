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
belongs_to(:movie)

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

return to_check

end

end
