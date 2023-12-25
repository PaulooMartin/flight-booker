class Airport < ApplicationRecord
  validates_presence_of :iata_code
end
