class CreateBadgesRules < ActiveRecord::Migration[6.1]
  def change
    create_table :badges_rules do |t|
      t.string :name, null: false, unique: true
      t.string :rule_type, null: false, unique: true

      t.timestamps
    end
  end
end
