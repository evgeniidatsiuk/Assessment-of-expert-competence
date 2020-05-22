class Variant < ApplicationRecord
  belongs_to :question
  validates_presence_of :title, :value
end
