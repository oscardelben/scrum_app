class Story < ActiveRecord::Base

  POINTS = [1,2,3,5,8,13,20,50,100].freeze
  STATES = [:backlog, :in_progress, :completed].freeze

  attr_accessible :description, :points, :state, :title

  attr_accessor :state

  validates :points, inclusion: { in: POINTS }
  validates :title, presence: true
  validates :state, inclusion: { in: STATES }

  def self.backlog
    where status: Story.status(:backlog)
  end

  def self.in_progress
    where status: Story.status(:in_progress)
  end

  def self.completed
    where status: Story.status(:completed)
  end

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
