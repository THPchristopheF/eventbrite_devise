class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :attendances
  has_many :events, through: :attendances
  has_many :admins, foreign_key: 'admin_id', class_name: 'Event'

  #after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end  
      
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
