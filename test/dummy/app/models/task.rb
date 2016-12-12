class Task < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
