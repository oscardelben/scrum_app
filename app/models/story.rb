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

  # Returns the internal status represented by `state`.
  def self.status state
    STATES.index state
  end

  # Returns the state represented by `status`
  def self.state status
    STATES[status] if status
  end

  # Returns the state description of the story.
  def state
    Story.state(status)
  end

  # Change state of the story.
  # You can pass both a Symbol representing the state
  # or a String (useful from Rails forms).
  def state= state
    self.status = Story.status(state.to_sym)
  end

end
