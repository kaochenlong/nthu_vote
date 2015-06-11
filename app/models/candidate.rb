class Candidate < ActiveRecord::Base
  has_many :votes
  validates :name, presence: true, length: {minimum: 2}
end
