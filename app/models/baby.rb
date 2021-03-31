class Baby < ApplicationRecord
has_one_attached :photo
has_many :events, dependent: :destroy
has_many :users, :through => :baby_users
validates :name, presence: true
validates :birth_date, :gender, :weight, :height, presence: true
end
