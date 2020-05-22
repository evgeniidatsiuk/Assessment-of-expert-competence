class Question < ApplicationRecord
  belongs_to :model
  has_many :variants

  accepts_nested_attributes_for :variants

  validates_presence_of :title
end
