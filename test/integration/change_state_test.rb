require 'test_helper'

class ChangeStateTest < ActionDispatch::IntegrationTest

  test 'new stories show up in the backlog' do
    visit new_story_path

    fill_in :title, with: 'Conquer the world'
    click_button 'Create Story'

    assert page.has_content? 'Story was successfully created.'

    within '#backlog' do
      assert page.has_content? 'Conquer the world'
    end
  end

  test 'stories can be moved the in progress section' do
    visit new_story_path

    fill_in :title, with: 'Conquer the world'
    select 'In Progress', from: 'State'
    click_button 'Create Story'

    assert page.has_content? 'Story was successfully created.'

    within '#in-progress' do
      assert page.has_content? 'Conquer the world'
    end
  end

  test 'stories can be completed' do
    visit new_story_path

    fill_in :title, with: 'Conquer the world'
    select 'Completed', from: 'State'
    click_button 'Create Story'

    assert page.has_content? 'Story was successfully created.'

    within '#completed' do
      assert page.has_content? 'Conquer the world'
    end
  end

end

