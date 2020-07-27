# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

User.create!(
   email: 'staff@com',
   password: 'staffnatsumi',
   name: '運営',
   profile_image: File.open('./app/assets/images/sttaf.jpg'),
   profile: 'こんにちは！運営のNATSUMIです。定期的に各都道府県をご紹介していきます！',
   birthplace: '東京都',
)

User.all.each do |user|
  user.posts.create!(
  	[
  		{
  			travel_spot: '北海道',
		    cost: '100000',
		    tag_list: '北海道地方',
		    point_a: '東京都',
		    point_b: '大阪府',
		    explanation: '北海道は日本の主要四島の中で最北端にある島で、火山、天然温泉、スキー場で知られています。起伏の激しい大雪山国立公園には蒸気を上げる火山の旭岳があり、支笏洞爺国立公園にはカルデラ湖、地熱温泉、富士山に似た羊蹄山があります。人気のスキーリゾートにはルスツ、富良野、ニセコなどがあります。',
		    travel_image: File.open('./app/assets/images/hokkaido.jpg')

  		},
  		{
  			travel_spot: '青森県',
		    cost: '100000',
		    tag_list: '東北地方',
		    point_a: '東京都',
		    point_b: '大阪府',
		    explanation: '青森県は本州北部に位置し、火山帯など雄大なる自然の景色で知られています。南部の県境にほど近い十和田八幡平国立公園には、温泉、秋に紅葉が見られる奥入瀬渓流、スキーができる八甲田山があり、十和田湖の中や周辺には、火山噴火により形成された溶岩ドームがあります。県庁所在地の青森市は、のんびりとした港町で、夏にはねぶた祭が開催されます。',
		    travel_image: File.open('./app/assets/images/aomori.jpg')

  		},
  		{
  			travel_spot: '東京都',
		    cost: '10000',
		    tag_list: '関東地方',
		    point_a: '東京都',
		    point_b: '大阪府',
		    explanation: '日本の首都、東京にはネオンに照らされた超高層ビルから歴史的な寺院まで、超現代的なものと伝統的なものが混在しています。豪華な明治神宮は、高くそびえる鳥居と鎮守の杜で知られています。皇居は広大な公共庭園の中にあります。市内には多くの博物館があり、古典芸術（東京国立博物館）から復元された歌舞伎場（江戸東京博物館）まで、さまざまな展示が行われています。',
		    travel_image: File.open('./app/assets/images/tokyo.jpg')
  		},
  		{
  			travel_spot: '静岡県',
		    cost: '50000',
		    tag_list: '中部地方',
		    point_a: '東京都',
		    point_b: '大阪府',
		    explanation: '静岡県は本州中部の太平洋沿岸に位置する県で、日本最高峰である標高 3,776 m の富士山があります。富士山は活火山としても有名で、その麓には富士山本宮浅間大社、白糸の滝、音止めの滝などがあります。富士山はまた、ハイキングのスポットとしても人気があり、ハイキング コースが多数あります。南にある伊豆半島は、下田をはじめとするビーチや温泉街で有名です。',
		    travel_image: File.open('./app/assets/images/shizuoka.jpg')
  		},
  		{
  			travel_spot: '京都府',
		    cost: '30000',
		    tag_list: '近畿地方',
		    point_a: '東京都',
		    point_b: '大阪府',
		    explanation: '京都は本州に位置する都市です。かつては首都でもあり、数多くの歴史ある仏教寺院、庭園、皇室の宮殿や御所、神社、伝統的な木造家屋で知られています。また、コース形式の献立が特徴の伝統ある懐石や、祇園の芸者も有名です。',
		    travel_image: File.open('./app/assets/images/kyoto.jpg')
  		},
  		{
  			travel_spot: '広島県',
		    cost: '50000',
		    tag_list: '中国地方',
		    point_a: '東京都',
		    point_b: '大阪府',
		    explanation: '広島県は本州にある県で、南は瀬戸内海に面し、北西部には中国山地が広がっています。県庁所在地の広島市は近代的な都市で、平和記念公園や、第二次世界大戦のさなか 1945 年に投下された原子爆弾の惨禍を今に伝える原爆ドームで知られています。',
		    travel_image: File.open('./app/assets/images/hiroshima.jpg')
  		},
  		{
  			travel_spot: '香川県',
		    cost: '80000',
		    tag_list: '四国地方',
		    point_a: '東京都',
		    point_b: '大阪府',
		    explanation: '香川県は四国の北東部にあり、南は讃岐山脈、北は瀬戸内海で、周辺には島々が点在しています。ここは八十八か所の霊場を巡る四国遍路の終着点でもあります。県庁所在地の高松市は、戦国時代に建てられた高松城と、栗林公園がある港湾都市です。栗林公園は、江戸時代に造園された公園で、鯉のいる池と茶室があります。',
		    travel_image: File.open('./app/assets/images/kagawa.jpg')
  		},
  		{
  			travel_spot: '長崎県',
		    cost: '90000',
		    tag_list: '九州地方',
		    point_a: '東京都',
		    point_b: '大阪府',
		    explanation: '長崎県は九州の西海岸にあり、火山、森林に覆われた沖合の島々、温泉地で知られています。県庁所在地の長崎市は 1945 年の原爆投下によって被害を受け、その惨禍を記す平和記念公園や原爆資料館があります。キリスト教の伝道の歴史は、19 世紀に造られた教会や 16 世紀建造の二十六聖人を称える日本二十六聖人記念館に反映されています。',
		    travel_image: File.open('./app/assets/images/nagasaki.jpg')
  		},
  		{
  			travel_spot: '沖縄県',
		    cost: '120000',
		    tag_list: '沖縄地方',
		    point_a: '東京都',
		    point_b: '大阪府',
		    explanation: '沖縄県は、台湾と本州の間、東シナ海に浮かぶ 150 以上の島からなります。熱帯気候、広大なビーチや珊瑚礁、第二次世界大戦の戦跡で知られています。沖縄最大の島、沖縄島には、連合国軍による 1945 年の大規模な侵攻を後世に伝えるために建てられた沖縄県平和祈念資料館、ジンベエザメとマンタがいる沖縄美ら海水族館があります。',
		    travel_image: File.open('./app/assets/images/okinawa.jpg')
  		}
  	]
  )
end