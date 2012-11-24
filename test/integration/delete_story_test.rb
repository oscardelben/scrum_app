require 'test_helper'

class DeleteStoryTest < ActionDispatch::IntegrationTest

  setup do
    @story = Story.create! title: 'My Story', points: 1
  end

  test 'updating a story' do
    visit stories_path

    assert page.has_content? 'My Story'
    click_link 'Destroy'

    assert page.has_content? 'Story was successfully deleted.'
    refute page.has_content? 'My Story'
  end
end

