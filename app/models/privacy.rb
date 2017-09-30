class Privacy < ApplicationRecord
  belongs_to :reflection, class_name: "Reflection"
  belongs_to :authorised_personal, class_name: "User"
end
