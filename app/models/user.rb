class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable #, :recoverable

  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :ecomics
end
