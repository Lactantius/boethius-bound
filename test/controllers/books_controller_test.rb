require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers
  # include Devise::Controllers::Helpers
  # include Devise::Controllers::Helpers::ClassMethods

  setup do
    @book = books(:one)
    @user = users(:normal)
    @admin = users(:admin)
    @params = { book: { author: @book.author, converter: @book.converter, heads: @book.heads, language: @book.language, location: @book.location, pubdate: @book.pubdate, title: @book.title } }

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

  test "should get redirect from new if not logged in" do
    get new_book_url
    assert_response :redirect
  end

  test "should get redirect from new if not admin" do
    sign_in @user
    get new_book_url
    assert_response :redirect
  end

  test "should get new if admin" do
    sign_in @admin
    get new_book_url
    assert_response :success
  end

  test "should not create book if not logged in" do
    refute_difference('Book.count') do
      post books_url, params: @params
    end

    assert_redirected_to new_user_session_path
  end

  test "should not create book if not admin" do
    sign_in @user
    refute_difference('Book.count') do
      post books_url, params: @params
    end

    assert_response :redirect
  end

  test "should create book if admin" do
    sign_in @admin
    assert_difference('Book.count') do
      post books_url, params: @params
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

  test "should not get edit if not logged in" do
    get edit_book_url(@book)
    assert_redirected_to new_user_session_path
  end

  test "should not get edit if not admin" do
    sign_in @user
    get edit_book_url(@book)
    assert_response :redirect
  end

  test "should get edit if admin" do
    sign_in @admin
    get edit_book_url(@book)
    assert_response :success
  end

  test "should not update book if not logged in" do
    patch book_url(@book), params: @params
    assert_redirected_to new_user_session_path
  end

  test "should not update book if not admin" do
    sign_in @user
    patch book_url(@book), params: @params
    assert_response :redirect
  end

  test "should update book if admin" do
    sign_in @admin
    patch book_url(@book), params: @params
    assert_redirected_to book_url(@book)
  end

  test "should not destroy book if not logged in" do
    refute_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to new_user_session_path
  end

  test "should not destroy book if not admin" do
    sign_in @user
    refute_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_response :redirect
  end

  test "should destroy book" do
    sign_in @admin
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end

end
