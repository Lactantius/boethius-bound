require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  # Having trouble with fixtures.
  test "to_hash function" do
    @project = projects(:one)
    @item_one = @project.project_items.build(project_items(:one).attributes)
    @item_two = @project.project_items.build(project_items(:two).attributes)
    tex = @project.to_hash
    assert tex[:project_items].first[:book][:title] == 'Bob’s Book'
    assert_not tex[:project_items].second[:book][:title] == 'Bob’s Book'
   end

end
