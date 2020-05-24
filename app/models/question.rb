class Question < ApplicationRecord
  belongs_to :model
  has_many :variants

  accepts_nested_attributes_for :variants, allow_destroy: true

  validates_presence_of :title
end
