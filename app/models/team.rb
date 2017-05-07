class Team < ApplicationRecord
  validates :name, :country, :engine_manufacturer, presence: true
  validates :debut_year, :number_of_constructor_championship, :number_of_driver_championship, :number_of_poles, numericality: { only_integer: true }
  validates :debut_year, length: { is: 4 }
end
