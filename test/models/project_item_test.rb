require 'test_helper'

class ProjectItemTest < ActiveSupport::TestCase

  setup do
    @project_item = ProjectItem.new(font: "Palatino")
  end

  test "should be valid" do
    assert @project_item.valid?
  end

  test "should reject missing font" do
    @project_item.font = ''
    refute @project_item.valid?
  end

end
