class CreateBadgeUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
    add_index :badge_users, [:badge_id, :user_id], unique: true
  end
end
