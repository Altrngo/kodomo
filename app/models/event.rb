class Event < ApplicationRecord
  DIAPER_CONTENT = %w(Urine Souillée Mixte)
  belongs_to :baby
  belongs_to :user
  # include PgSearch::Model
  # pg_search_scope :search_by_start_time,
  #   against: [ :start_time ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
