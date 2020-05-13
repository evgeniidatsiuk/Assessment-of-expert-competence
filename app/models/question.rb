class Question < ApplicationRecord
    belongs_to :model
    has_many :variants

    validates :name, presence: true
end
