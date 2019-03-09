class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :pic
      t.string :flyer
      t.text :content
      t.references :user, foreign_key: true
      t.datetime :datetime
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
