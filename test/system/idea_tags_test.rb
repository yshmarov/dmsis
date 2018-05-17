require "application_system_test_case"

class IdeaTagsTest < ApplicationSystemTestCase
  setup do
    @idea_tag = idea_tags(:one)
  end

  test "visiting the index" do
    visit idea_tags_url
    assert_selector "h1", text: "Idea Tags"
  end

  test "creating a Idea tag" do
    visit idea_tags_url
    click_on "New Idea Tag"

    fill_in "Idea", with: @idea_tag.idea_id
    fill_in "Tag", with: @idea_tag.tag_id
    click_on "Create Idea tag"

    assert_text "Idea tag was successfully created"
    click_on "Back"
  end

  test "updating a Idea tag" do
    visit idea_tags_url
    click_on "Edit", match: :first

    fill_in "Idea", with: @idea_tag.idea_id
    fill_in "Tag", with: @idea_tag.tag_id
    click_on "Update Idea tag"

    assert_text "Idea tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Idea tag" do
    visit idea_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Idea tag was successfully destroyed"
  end
end
