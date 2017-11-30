require "test_helper"

class CanCompileBookTest < Capybara::Rails::TestCase

  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:normal)
    @book = books(:one)
    @book.save
  end

  test "can compile book" do
    visit projects_path
    click_on 'Start a new project'
    page.fill_in 'project-name', with: 'Bob’s Project'
    page.click_button 'Create Project'
    click_on 'Add some books.'
    click_on "#{@book.title}"
    page.fill_in 'project_item[font]', with: 'Palatino'
    click_on 'Add to Project'
    click_on 'Compile your project!'
    assert page.has_content?('Download PDF')
    click_on 'Download PDF'
  end

end
