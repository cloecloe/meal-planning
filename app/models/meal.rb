class Meal < ApplicationRecord
  belongs_to :recipe
  belongs_to :calendar
  validates :date, presence: true
  validates :tagname, presence: true
end
