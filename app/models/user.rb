class User < ApplicationRecord

  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable and :omniauthable

  acts_as_commontator
  has_many :reflections

  has_many :reflection_privacies, class_name: "Privacy", foreign_key: "authorised_personal_id"
  has_many :visible_reflections, through: :reflection_privacies, source: :reflection

  has_many :reflection_reviews, class_name: "Review", foreign_key: "reviewer_id"
  has_many :request_reflections, through: :reflection_reviews, source: :reflection
end
