class RadikoChannel < Channel
  belongs_to :station
  validate :station_id, presence: true
end
