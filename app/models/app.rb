class App < ApplicationRecord
  belongs_to :client
  has_many :class_maps
  has_many :events
end
