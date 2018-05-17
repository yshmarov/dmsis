require 'test_helper'

class IdeaTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idea_tag = idea_tags(:one)
  end

  test "should get index" do
    get idea_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_idea_tag_url
    assert_response :success
  end

  test "should create idea_tag" do
    assert_difference('IdeaTag.count') do
      post idea_tags_url, params: { idea_tag: { idea_id: @idea_tag.idea_id, tag_id: @idea_tag.tag_id } }
    end

    assert_redirected_to idea_tag_url(IdeaTag.last)
  end

  test "should show idea_tag" do
    get idea_tag_url(@idea_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_idea_tag_url(@idea_tag)
    assert_response :success
  end

  test "should update idea_tag" do
    patch idea_tag_url(@idea_tag), params: { idea_tag: { idea_id: @idea_tag.idea_id, tag_id: @idea_tag.tag_id } }
    assert_redirected_to idea_tag_url(@idea_tag)
  end

  test "should destroy idea_tag" do
    assert_difference('IdeaTag.count', -1) do
      delete idea_tag_url(@idea_tag)
    end

    assert_redirected_to idea_tags_url
  end
end
