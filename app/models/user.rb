class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(name: 'ゲストユーザー', email: 'guest@example.com', birthplace: '東京都') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  attachment :profile_image, destroy: false
  validates :name, presence: true, length: {in: 2..20 }
  validates :profile, length: { maximum: 140 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :favorites, dependent: :destroy
  # dependent: :destroyは、has_manyで使えるオプション。
  # 1:Nの関係において、「1」のデータが削除された場合、関連する「N」のデータも削除される設定。

  # follow フォローしている follower フォローされてる
  # =====自分がフォローしているユーザーとの関連=====
  # フォローする側のUserから見て、フォローされる側のUserを集まるので、親はfollow_id(フォローする側)
  has_many :active_relationships, class_name:"Relationship", foreign_key: :following_id # フォロワー取得
  has_many :followings, through: :active_relationships, source: :follower # 自分がフォローしている人

  # =====自分がフォローされるユーザーとの関連=====
  # フォローされる側のUserから見て、フォローしてくる側のUserを集めるので、親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name:"Relationship", foreign_key: :follower_id # フォロー取得
  has_many :followers, through: :passive_relationships, source: :following # 自分がフォローされている人

  def followed_by?(user)
  passive_relationships.find_by(following_id: user.id).present?
  end
  # フォローしたユーザーが過去にフォローしていたか調べる


  enum birthplace: {
  "--未選択--":0,北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
  茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
  新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
  岐阜県:21,静岡県:22,愛知県:23,三重県:24,
  滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
  鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
  徳島県:36,香川県:37,愛媛県:38,高知県:39,
  福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

end
