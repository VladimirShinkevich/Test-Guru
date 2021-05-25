# frozen_string_literal: true

class ChangeUserNameToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :name, true
  end
end
