class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.integer :prefectures_name

      t.timestamps
    end
  end
end
