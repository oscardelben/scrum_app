
require 'test_helper'

class CreateStoryTest < ActionDispatch::IntegrationTest

  test 'Creating a new story' do
    visit stories_path

    refute page.has_content? 'My Story'

    click_link 'New Story'

    fill_in :title, with: 'My Story'
    select '3', from: :points
    click_button 'Create Story'

    assert page.has_content? 'Story was successfully created.'

    assert page.has_content? 'My Story'
  end

  test 'Creating a new story with errors' do
    visit new_story_path

    click_button 'Create Story'

    assert page.has_content? 'There was an error saving the story.'
  end
end
