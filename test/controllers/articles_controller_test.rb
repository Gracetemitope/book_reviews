require 'test_helper'

class reviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post reviews_url, params: { article: {  } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@review)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@review)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@review), params: { article: {  } }
    assert_redirected_to article_url(@review)
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@review)
    end

    assert_redirected_to reviews_url
  end
end
