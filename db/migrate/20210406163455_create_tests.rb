class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level, default: 0, null: false
      t.references :category, foreign_key: true, null: false
      t.references :author, foreign_key: {to_table: :users}, null: false	
      t.timestamps
    end
  end
end
