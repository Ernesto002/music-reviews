class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.string :medium_type
      t.timestamps
    end
  end
end
