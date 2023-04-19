class Day < ApplicationRecord
  serialize :history, Array
  belongs_to :user
end
