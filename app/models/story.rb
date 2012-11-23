class Story < ActiveRecord::Base

  POINTS = [1,2,3,5,8,13,20,50,100].freeze
  STATES = [:backlog, :in_progress, :completed].freeze

  attr_accessible :description, :points, :state, :title

  attr_accessor :state

  validates :points, inclusion: { in: POINTS }
  validates :title, presence: true
  validates :state, inclusion: { in: STATES }

  def self.status state
    STATES.index state
  end

  def self.state status
    STATES[status] if status
  end

  def state
    Story.state(status)
  end

  def state= state
    self.status = Story.status(state)
  end

end
