class ExternalDatum < ApplicationRecord
  enum source_type: {
    ny_times: 0
  }
end
