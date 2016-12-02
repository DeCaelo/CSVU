class CreateVinyls < ActiveRecord::Migration[5.0]
  def change
    create_table :vinyls do |t|
      t.string :catalog
      t.string :artist
      t.string :title
      t.string :label
      t.string :format
      t.integer :rating
      t.integer :released
      t.integer :release_id
      t.string :notes
      t.datetime :date

      t.timestamps
    end
  end
end
