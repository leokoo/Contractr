class User < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :skills
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :identities
  has_many :bids
  has_many :groups
  has_many :jobs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
         
  validates :fullname, presence: true, length: {maximum: 50}
  validates_uniqueness_of :user_skills
  # validates :email, uniqueness: true, allow_nil: true

  has_many :jobs
  has_many :skills
  has_many :votes
  serialize :user_skills

  def self.from_omniauth(auth)
  	user = User.where(email: auth.info.email).first

    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.fullname = auth.info.name
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
    end
  end

  def has_skill?(skill)
    return false if user_skills.nil?
    user_skills.include?(skill) 
  end

end
