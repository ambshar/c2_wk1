class RemoveUseridOldColumn < ActiveRecord::Migration
  def change
    remove_column :votes, :userid_old
  end
end