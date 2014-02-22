class RemoveUserIdColumnFromVotes < ActiveRecord::Migration
  def self.up
    remove_column :votes, :user_id, :string
  end

  def self.down
    add_column :votes, :user_id, :string
    
  end
end
