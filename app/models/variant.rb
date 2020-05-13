class Variant < ApplicationRecord
  belongs_to :question
  validates :name, :value, presence: true
end
