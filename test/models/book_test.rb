require 'test_helper'

class BookTest < ActiveSupport::TestCase

  setup do
    @book = Book.new(title: "Adventures of Bob", author: "Bob Bobson",
                     location: "/dev/null", converter: "BOB",
                     language: "english", pubdate: 1875)
  end

  test "should be valid" do
    assert @book.valid?
  end

  test "should reject string publication dates" do
    @book.pubdate = "bob"
    refute @book.valid?
  end

  test "should reject missing location" do
    @book.location = ''
    refute @book.valid?
  end

end
