module Dashboard
  class AnalyticReport < ActiveRecord::Base
    TYPES = %w(GeneralOverview Financial AppSegment)
  end
end
