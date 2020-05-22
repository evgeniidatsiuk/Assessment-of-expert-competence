class Setting < ApplicationRecord
  validates_presence_of :model_count, :experiment_count
end
