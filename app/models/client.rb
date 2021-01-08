class Client < ApplicationRecord
  has_many :apps
  has_many :class_maps
  has_many :events
end
