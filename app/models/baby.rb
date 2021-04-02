class Baby < ApplicationRecord
  GENDER = %w(Fille Garçon)
  has_one_attached :photo
  has_many :events, dependent: :destroy
  has_many :baby_users, dependent: :destroy
  has_many :users, through: :baby_user
  validates :name, presence: true
  validates :birth_date, :weight, :height, presence: true
  validates :gender, inclusion: { in: GENDER}

  def age
    start_time = self.birth_date
    end_time = Date.today
    absolute = TimeDifference.between(start_time, end_time).in_general
    if absolute[:years] > 2
      return "#{absolute[:years]} ans et #{absolute[:months]} mois"
    elsif absolute[:months] > 1
      return "#{absolute[:months]} mois et #{absolute[:days]} jours"
    else
      return "#{absolute[:days]} jours et #{absolute[:hours]} heures"
    end
  end
end
