class Event < ApplicationRecord
  DIAPER_CONTENT = %w(Urine Selles Mixte)
  belongs_to :baby
  belongs_to :user
end
