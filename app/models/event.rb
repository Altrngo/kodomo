class Event < ApplicationRecord
  DIAPER_CONTENT = %w(Urine Souillée Mixte)
  belongs_to :baby
  belongs_to :user

end
