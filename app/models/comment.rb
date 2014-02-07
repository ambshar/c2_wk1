class Comment < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User' 
  belongs_to :post
  has_many :votes, as: :voteable

  validates :body, presence: true

  def total_votes
    sum_up_votes - sum_down_votes
  end

  def sum_up_votes
    self.votes.where(vote: true).size
    
  end

  def sum_down_votes
     self.votes.where(vote: false).size
  end
  
end