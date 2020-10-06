require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "lets write a new article" do
    visit articles_url
    # save_and_open_screenshot

    click_on 'create'

    fill_in "Title", with: "Testing Title"
    fill_in "Content", with: "Testing content"
    # save_and_open_screenshot

    click_on 'Create Article'
    # save_and_open_screenshot
    article = Article.last
    # Should be redirected to Home with new product
    assert_equal article_path(article), page.current_path
    assert_text "Testing Title"
    assert_text "Testing content"

    click_on 'list'
    assert_text "Testing Title"
  end

  test "lets update a new article" do
    visit articles_url
    click_on 'create'
    fill_in "Title", with: "Testing Title"
    fill_in "Content", with: "Testing content"
    click_on 'Create Article'
    click_on 'edit'
    fill_in "Title", with: "Testing Title 2"
    fill_in "Content", with: "Testing content 2"
    click_on 'Update Article'
    assert_text "Testing Title 2"
  end
end
