# frozen_string_literal: true

class CreatePassTests < ActiveRecord::Migration[6.1]
  def change
    create_table :pass_tests do |t|
      t.boolean :passed, default: false
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
      t.timestamps
    end
  end
end
