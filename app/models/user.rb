class User < ApplicationRecord
  has_many :favourites
  has_many :days
end
