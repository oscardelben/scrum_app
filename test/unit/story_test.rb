require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  test '.status takes a state and returns an enum representing the state' do
    assert_equal 0, Story.status(:backlog)
    assert_equal 1, Story.status(:in_progress)
    assert_equal 2, Story.status(:completed)
  end

  test '.state returns a state from an enum status' do
    assert_equal :backlog, Story.state(0)
    assert_equal :in_progress, Story.state(1)
    assert_equal :completed, Story.state(2)
  end

  test 'points' do
    assert_equal [1,2,3,5,8,13,20,50,100], Story::POINTS
  end

  test 'validation on points' do
    Story::POINTS.each do |p|
      story = Story.new points: p
      story.valid?
      assert story.errors[:points].blank?
    end
  end

  test 'validation on empty points' do
    story = Story.new points: nil
    story.valid?

    assert story.errors[:points].present?
  end

  test 'validation on invalid points' do
    story = Story.new points: 11
    story.valid?

    assert story.errors[:points].present?
  end

  test 'validation on title' do
    story = Story.new title: '   '
    story.valid?

    assert story.errors[:title].present?
  end

  test 'state default value' do
    story = Story.new
    story.save

    assert_equal :backlog, story.state
  end

  test 'state validation' do
    [:backlog, :in_progress, :completed].each do |state|
      story = Story.new state: state
      story.valid?

      assert story.errors[:state].blank?
    end
  end

  test 'invalid state' do
    story = Story.new state: :invalid_state
    story.valid?

    assert story.errors[:state].present?
  end

  test 'assigning backlog state' do
    story = Story.new state: :backlog

    assert_equal :backlog, story.state
    assert_equal 0, story.status
  end

  test 'assigning in-progress state' do
    story = Story.new state: :in_progress

    assert_equal :in_progress, story.state
    assert_equal 1, story.status
  end

  test 'assigning completed state' do
    story = Story.new state: :completed

    assert_equal :completed, story.state
    assert_equal 2, story.status
  end
end
