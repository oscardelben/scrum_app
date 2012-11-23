require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  test 'points' do
    assert_equal [1,2,3,5,8,13,20,50,100], Story::Points
  end

  test 'validation on points' do
    Story::Points.each do |p|
      story = Story.new points: p
      story.valid?
      assert story.errors[:points].blank?
    end
  end

  test 'validation on empty points' do
    story = Story.new points: nil
    story.valid?
    refute story.errors[:points].blank?
  end

  test 'validation on invalid points' do
    story = Story.new points: 11
    story.valid?
    refute story.errors[:points].blank?
  end

  test 'validation on title' do
    story = Story.new title: '   '
    story.valid?
    refute story.errors[:title].blank?
  end
end
