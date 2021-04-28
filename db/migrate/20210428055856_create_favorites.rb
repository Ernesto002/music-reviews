class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.boolean :favorited
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :medium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
