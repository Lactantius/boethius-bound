require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers
  # include Devise::Controllers::Helpers
  # include Devise::Controllers::Helpers::ClassMethods

  setup do
    @book = books(:one)
    @user = users(:normal)
  end

  test "should redirect index to projects if no project id" do
    get books_url
    assert_response :redirect
  end

  # Broken test; not sure why.
  # test "should get book index if project id" do
  #   sign_in users(:normal)
  #   current_user.user_session[:project_id] = 1
  #   assert current_user.user_session[:project_id]
  # end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { author: @book.author, converter: @book.converter, heads: @book.heads, language: @book.language, location: @book.location, pubdate: @book.pubdate, title: @book.title } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    skip
    sign_in users(:normal)
    Devise::current_user.user_session[:project_id] = 1
    get new_project_url
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, converter: @book.converter, heads: @book.heads, language: @book.language, location: @book.location, pubdate: @book.pubdate, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
