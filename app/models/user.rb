class User < ActiveRecord::Base
  include Sluggable
  has_many :posts
  has_many :comments
  has_many :votes
  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 3} 

  sluggable_column :username
  
  before_create { |user| user.username = user.username.downcase}
  
  
  def admin?
    self.role.to_s.to_sym == :admin  #comparing as symbol for performance. can do a string comparison as well
  end


end