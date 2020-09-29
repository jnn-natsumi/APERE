require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
	describe 'バリテーションのテスト' do
		let(:user) { create(:user) }
		let!(:post) { build(:post, user_id: user.id) }

		context 'explanationカラム' do
			it '空欄ではないこと' do
				post.explanation = ''
				expect(post.valid?).to eq false;
			end
			it '500文字以下であること' do
				post.explanation = Faker::Lorem.characters(number:501)
				expect(post.valid?).to eq false;
			end
		end
	end
	describe 'アソシエーションのテスト' do
		context 'Userモデルとの関係' do
			it 'N:1となっている' do
				expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
			end
		end
	end
end
