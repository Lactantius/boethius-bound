require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  setup do
    @project = projects(:one)
    @pdf = Rails.root.join("projects/#{@project[:id]}.pdf")
    File.delete(@pdf) if File.exist?(@pdf)
  end

  # Having trouble with fixtures.
  test "to_hash function" do
    @item_one = @project.project_items.build(project_items(:one).attributes)
    @item_two = @project.project_items.build(project_items(:two).attributes)
    tex = @project.to_hash
    assert tex[:project_items].first[:book][:title] == 'Bob’s Book'
    assert_not tex[:project_items].second[:book][:title] == 'Bob’s Book'
   end

  test "pdf_exist_function" do
    File.new(@pdf, 'w')
    assert @project.pdf_exist?
    File.delete(@pdf)
    assert_not @project.pdf_exist?
  end

end
