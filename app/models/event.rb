class Event < ApplicationRecord
  DIAPER_CONTENT = %w(Urine Souillée Mixte)
  belongs_to :baby
  belongs_to :user

  validates :content, inclusion: { in: DIAPER_CONTENT}
end
