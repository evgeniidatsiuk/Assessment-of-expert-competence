class Setting < ApplicationRecord
    validates  :model_count, :experiment_count, presence: true
end
