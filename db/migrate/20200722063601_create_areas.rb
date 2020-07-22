class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.integer :prefectures_id
      t.string :areas_name

      t.timestamps
    end
  end
end
