class Review < ApplicationRecord
  belongs_to :reflection, class_name: "Reflection"
  belongs_to :reviewer, class_name: "User"
end
