# APERE

## サイト概要

ユーザー投稿型の旅行アプリ "APERE" （アペレ）です。<br>
２箇所指定していただくと、直線距離と中間地点の住所を表示してくれます。<br>
また、自分が行ったことのある観光地を投稿できます。<br>

### サイトテーマ　
遠距離カップルの旅を楽しむ旅行アプリ



### テーマを選んだ理由
以下の2つの理由から、このテーマを選びました。<br>

　**1.遠距離カップルの"障害"をなくしたい**

上京がキッカケで遠距離恋愛になるカップルは多いです。<br>

実際に、私が大学生から社会人になったタイミングで、<br>
知り合いのカップル達が「遠距離になって別れた〜」という人が多かったです。<br>

もちろん、新しい出会いによる別れや価値観の相違などの理由もあるかもしれませんが、<br>
遠距離にならなければこのままずっと生涯を共にしていたかもしれません。<br>

そんな物理的距離の遠さという２人の"障害"を、少しでも減らせればと思い、<br>
遠距離カップルをターゲットにしたアプリを考えました。<br>


　**2.会うための"費用"で悩んでいるカップルが多い**

遠距離カップル（対象12名）にアンケートを取ったところ、以下の回答がありました。<br>

Q. 遠距離恋愛で辛い・辛かったことは？（複数回答 可）<br>
A.１位：会う時の費用が掛かる(9/12人中)<br>
　 ２位：落ち込んだ時に側にいない(8/12中) 他...<br>

「側にいない」のと同率で「交通費等の費用」で苦しんでる人がいることが分かりました。<br>「中間地点で会えればお互いの交通費はそれぞれ出せるのに」「中間地点にいい場所がない！」<br>
・・・と、お金のことでモヤモヤする。<br>
それなら、２人の中間地点で「ここ行きたい！」「ここなら交通費がお互い安い！」という場所を提案できれば、<br>
この遠距離恋愛ならではの辛さは軽減されるのでは？と考え、旅行アプリというテーマにしました。<br>

### ターゲットユーザ
遠距離カップル<br>
（遠くに住む友人とのシーンや、１人旅で旅の検索ツールとしてでも利用可能です。）

### 主な利用シーン
次に会う予定を立てる時・旅行に行ったところを記録に残す時<br>

### 開発環境
 **サーバーエンド・フロントエンド**
+ ruby '2.5.7'
+ rails '5.2.4.3'
+ Gem
  1. bootstrap-sass '3.3.6'
  2. jquery-rails
  3. refile-mini_magick
  4. pry-byebug
  5. geocoder
  6. jp_prefecture
  7. dotenv-rails
  8. acts-as-taggable-on '6.0'

 **本番サーバー環境**
+ AWS（EC2 / RDS / EIP）
+ MySQL
+ Nginx

### 機能
+ 新規登録 / ログイン機能
+ 投稿 / 投稿削除 / 投稿編集機能
+ ユーザー編集機能
+ タグ検索機能
+ いいね機能
+ コメント機能
+ フォロー機能
+ GoogleMapApiを用いた住所検索機能
+ GoogleMapApiを用いた2地点間の距離算出機能
+ RSpec : modelに関して

### URL

[APERE](http://apere.work/)

 **作者ホームページ**
 [My Portfolio Site](https://jnnnatsumi-23.herokuapp.com/#/)




