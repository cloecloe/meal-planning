class Calendar < ApplicationRecord
    has_many :users
    has_many :meals, dependent: :destroy
end
