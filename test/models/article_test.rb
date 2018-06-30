require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article = Article.new(title: 'article Title', description:
        'article description')

  end

  test "article should be valid" do
    assert_not @article.valid?
  end

  test "title should not be too short" do
    @article.title = "a" * 2
    assert_not @article.valid?
  end

  test "description should not be too short" do
    @article.description = "a" * 8
    assert_not @article.valid?
  end

  test "description should not be too long" do
    @article.description = "bf" * 151
    assert_not @article.valid?
  end



end
