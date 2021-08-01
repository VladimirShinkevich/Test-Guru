class AddColumnCorrectPassedTestToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :correct_passed_test, :boolean, default: false
  end
end
