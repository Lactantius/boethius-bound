require "test_helper"

class CanMakeProjectTest < Capybara::Rails::TestCase

  include Devise::Test::IntegrationHelpers

  setup do
    @book = books(:one)
    @book.save
  end

  test "can make project and add a book" do
    sign_in users(:normal)
    visit projects_path
    assert page.has_content?('Your Projects')
    click_on 'Start a new project'
    assert page.has_content?('New Project')
    refute page.has_content?('Your Projects')
    page.fill_in 'project-name', with: 'Bob’s Project'
    page.click_button 'Create Project'
    assert page.has_content?('Bob’s Project')
    refute page.has_content?('Download PDF')
    click_on 'Add some books.'
    assert page.has_content?('Books')
    click_on "#{books(:one).title}"
    assert page.has_content?("#{books(:one).title}")
    page.fill_in 'project_item[font]', with: 'BobFont'
    click_on 'Add to Project'
    assert page.has_content?('Bob’s Project')
    refute page.has_content?('Download PDF')
  end

end
