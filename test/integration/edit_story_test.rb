require 'test_helper'

class EditStoryTest < ActionDispatch::IntegrationTest

  setup do
    @story = Story.create! title: 'My Story', points: 1
  end

  test 'updating a story' do
    visit stories_path

    within "#story-#{@story.id}" do
      click_link 'Edit'
    end

    fill_in :title, with: 'Updated title'

    click_button 'Update Story'

    assert page.has_content? 'Story was successfully updated.'
    assert page.has_content? 'Updated title'
  end

  test 'updating a story with wrong attributes' do
    visit edit_story_path(@story)

    fill_in :title, with: ''

    click_button 'Update Story'

    assert page.has_content? 'There was an error updating the story.'
  end
end

