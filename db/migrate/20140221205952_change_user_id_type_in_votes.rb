class ChangeUserIdTypeInVotes < ActiveRecord::Migration
  def change
    change_column :votes, :user_id, :integer
  end
end
