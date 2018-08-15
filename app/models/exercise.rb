class Exercise < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :workout, optional: true

end
