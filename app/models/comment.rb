class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :commenter, class_name: "User"


end
