class CreateMusic < ActiveRecord::Migration[6.0]
  def change
    create_table :music do |t|
      t.string :music_type
      t.timestamps
    end
  end
end
