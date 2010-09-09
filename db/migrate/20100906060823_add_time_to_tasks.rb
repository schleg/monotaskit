class AddTimeToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :length, :integer
  end

  def self.down
    remove_column :tasks, :length
  end
end
