class Vote < ActiveRecord::Base
  belongs_to :candidate, counter_cache: true
end
