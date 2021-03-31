class Baby < ApplicationRecord
  GENDER = %w(Fille Garçon)
  has_one_attached :photo
  has_many :events, dependent: :destroy
  has_many :users, :through => :baby_users
  validates :name, presence: true
  validates :birth_date, :weight, :height, presence: true
  validates :gender, inclusion: { in: GENDER}
end
