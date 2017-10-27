class User < ActiveRecord::Base
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]+)\z/i
  has_secure_password
  validates :firstname, :lastname, :email, presence: :true
  validates :email, uniqueness: :true, format: {with: email_regex}
  before_save :downcase_email


  has_many :items
  belongs_to :dept
  has_many :comments, as: :commentable


  has_many :wishes, foreign_key: :wisher_id
  has_many :wished_fors, through: :wishes, source: :wished_for


  has_many :friendships, foreign_key: :user_id
  has_many :friends, through: :friendships, source: :friend

  has_many :relationships, foreign_key: :friend_id, class_name: "Friendship"
  has_many :users, through: :relationships, source: :user


  has_many :santa, foreign_key: :gifter_id
  has_many :giftees, through: :santa, source: :giftee

  has_many :assigned, foreign_key: :giftee_id, class_name: "Santum"
  has_many :gifters, through: :assigned, source: :gifter


  has_many :supervisions, foreign_key: :lead_id
  has_many :drs, through: :supervisions, source: :dr

  has_many :monitors, foreign_key: :dr_id, class_name: "Supervision"
  has_many :leads, through: :monitors, source: :lead


  has_many :messages, foreign_key: :recipient_id
  has_many :senders, through: :messages, source: :sender

  has_many :missives, foreign_key: :sender_id, class_name: "Message"
  has_many :recipients, through: :missives, source: :recipient



  def downcase_email
  	self.email.downcase!
  end 

  def update_user(params)
    user = User.find(current_user.id)
    user.firstname = params[:firstname]
    user.lastname = params[:lastname]
    user.email = params[:email]
    user.location = params[:location]
    user.country = params[:country]
    user.save
    return user
  end 

end
