class Relationship < ApplicationRecord

# follow フォローしている follower フォローされてる
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"
end
