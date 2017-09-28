require 'test_helper'

class BookTest < ActiveSupport::TestCase

  setup do
    @book = Book.new(title: "Adventures of Bob", author: "Bob Bobson",
                     location: "/dev/null", converter: "BOB",
                     language: "english", pubdate: 1875, id: 1)
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

  test "should reject missing author" do
    @book.author = ''
    refute @book.valid?
  end

  test "should reject missing title" do
    @book.title = ''
    refute @book.valid?
  end

  test "should reject missing converter and content" do
    @book.content = ''
    @book.converter = ''
    refute @book.valid?
  end

  test "should reject missing language" do
    @book.language = ''
    refute @book.valid?
  end

end
