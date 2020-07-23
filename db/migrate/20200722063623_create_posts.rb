class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	t.integer :user_id
    	t.integer :prefectures_id
    	t.integer :travel_spot
    	t.integer :cost
    	t.string :tag
    	t.integer :point_a
    	t.integer :point_b
    	t.text :explanation
    	t.string :travel_image_id

    	t.timestamps
    end
  end
end
