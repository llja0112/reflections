class Reflection < ApplicationRecord
  enum privacy: [ 'Private', 'Public' ]
  acts_as_commontable

  belongs_to :user
end
