class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image, null: false 
      t.references :rule, foreign_key: {to_table: :badges_rules}, null: false

      t.timestamps
    end
  end
end
