class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :identities
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
         
  validates :fullname, presence: true, length: {maximum: 50}

  def self.create_with_omniauth(info)
    create(name: info['name'])
  end

end
