# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  fullname               :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  provider               :string
#  uid                    :string
#  image                  :string
#  phone_number           :string
#  description            :text
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :identities
  has_many :bids
  has_many :jobs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
         
  validates :fullname, presence: true, length: {maximum: 50}
  # validates :email, uniqueness: true, allow_nil: true

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

end
