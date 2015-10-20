class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :surveys
  #accepts_nested_attributes_for :surveys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
