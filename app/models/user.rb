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
  
  def two_factor_auth?
    !self.phone.blank?
  end

  def generate_pin!
    self.update_column(:pin, rand(10 ** 6))
  end

  def remove_pin!
   self.update_column(:pin, nil)
  end

  def send_pin_to_twilio

    # put your own credentials here 
    account_sid = 'AC07a65fa461edad65e558e2363e2df1d8' 
    auth_token = '0a99ec804b5bd9f7a75b5ef94bbe84f5' 
 
    # set up a client to talk to the Twilio REST API 
    client = Twilio::REST::Client.new account_sid, auth_token 
 
    msg = "Please enter your 6 digit PIN #{self.pin}"
    client.account.messages.create({
      :from => '+15109077330', 
      :to => self.phone, 
      :body => msg,  
    })
      
  end

  def admin?
    self.role.to_s.to_sym == :admin  #comparing as symbol for performance. can do a string comparison as well
  end


end