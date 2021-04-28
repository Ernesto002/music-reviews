class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.belongs_to :medium, foreign_key: true
      t.belongs_to :album, foreign_key: true
      t.timestamps
    end
  end
end
