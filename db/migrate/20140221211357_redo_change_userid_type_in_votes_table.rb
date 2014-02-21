class RedoChangeUseridTypeInVotesTable < ActiveRecord::Migration
  def change
    change_table :votes do |t|
      t.rename :user_id, :userid_old
      t.integer :user_id

      
    end
  end
end
