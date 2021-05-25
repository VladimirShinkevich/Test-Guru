# frozen_string_literal: true

class RenameUserColumnPasswordToPasswordDigest < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :password, :password_digest
  end
end
