class Meal < ApplicationRecord
  belongs_to :recipe
  belongs_to :calendar
end
