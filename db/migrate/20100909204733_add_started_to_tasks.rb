class AddStartedToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :started, :datetime
  end

  def self.down
    remove_column :tasks, :started
  end
end
