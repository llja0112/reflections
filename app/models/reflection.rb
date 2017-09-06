class Reflection < ApplicationRecord
  enum privacy: [ 'Private', 'Public' ]
  belongs_to :user
end
