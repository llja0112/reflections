class User < ApplicationRecord

  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable and :omniauthable

  acts_as_commontator
  has_many :reflections
end
