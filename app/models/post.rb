class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User' 
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories 
  has_many :votes, as: :voteable

  validates :title,  presence: true, length: {minimum: 5}
  validates :description,  presence: true
  validates :url,  presence: true

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