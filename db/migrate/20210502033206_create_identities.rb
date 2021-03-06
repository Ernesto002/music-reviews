class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities do |t|
      t.string :provider
      t.string :uid
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
