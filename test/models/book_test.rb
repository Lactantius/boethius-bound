require 'test_helper'

class BookTest < ActiveSupport::TestCase

  def setup
    @book = Book.new(title: "Adventures of Bob", author: "Bob Bobson",
                     location: "/dev/null", converter: "BOB",
                     language: "english", pubdate: 1875)
  end

  test "should be valid" do
    assert @book.valid?
  end

end
