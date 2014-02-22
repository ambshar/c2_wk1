class RemoveUserIdColumnInVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :user_id, :integer
  end
end
