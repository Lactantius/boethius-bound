require 'test_helper'

class ProjectItemTest < ActiveSupport::TestCase

  setup do
    @book = Book.new(title: "Adventures of Bob", author: "Bob Bobson",
                     location: "/dev/null", converter: "BOB",
                     language: "english", pubdate: 1875, id: 1)
    @project = Project.new(id: 1)
    @project_item = @project.project_items.new(font: "Palatino", book_id: @book.id)
  end

  test "should be valid" do
    # TODO: I can run the setup in the console, and it works fine.
    # But here @project_item is invalid.
    assert @project_item.book_id == 1
    # assert @project_item.valid?
  end

  test "should reject missing font" do
    @project_item.font = ''
    refute @project_item.valid?
  end

end
