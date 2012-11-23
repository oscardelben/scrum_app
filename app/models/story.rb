class Story < ActiveRecord::Base

  Points = [1,2,3,5,8,13,20,50,100].freeze

  attr_accessible :description, :points, :state, :title

  validates :points, inclusion: { in: Points }
  validates :title, presence: true
end
