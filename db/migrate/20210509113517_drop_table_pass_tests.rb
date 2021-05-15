class DropTablePassTests < ActiveRecord::Migration[6.1]
  def up
    drop_table :pass_tests, if_exists: true
  end
end
