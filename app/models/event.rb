class Event < ApplicationRecord
  DIAPER_CONTENT = %w(Urine Selles Mixte)
  belongs_to :baby
  belongs_to :user

  def calculate_duration
    duration = (self.end_time - self.start_time)

    durationLabel = []
    separator     = " "

    hours = (duration / 3600).floor
    restDuration = duration%3600
    durationLabel << "#{hours}h" if hours > 0
    return durationLabel.join separator if restDuration.floor == 0
    minutes = (restDuration / 60).floor
    restDuration = duration%60
    durationLabel << "#{minutes}m" if minutes > 0
    return durationLabel.join separator if restDuration.floor == 0
    seconds = restDuration.floor
    durationLabel << "#{seconds}s" if seconds > 0
    durationLabel.join separator
    end
end
