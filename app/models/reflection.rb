class Reflection < ApplicationRecord
  enum privacy: [ 'Private', 'Public' ]
  acts_as_commontable

  belongs_to :user

  has_many :reflection_privacies, class_name: "Privacy", foreign_key: "reflection_id"
  has_many :authorised_personals, through: :reflection_privacies, source: :authorised_personal
end
