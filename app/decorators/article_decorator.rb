class ArticleDecorator < ApplicationDecorator
  include Draper::LazyHelpers
  delegate_all
  decorates :article
  decorates_associations :comment, :category, :article_category
  decorates_finders

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  #

  def check_if_article_has_user
    if model.user
    end
  end

  def link_to_gravatar_and_user_path
    link_to_params(gravatar_for(model.user), user_path(model.user))
  end

  def link_to_article_and_user_path
    link_to_params(model.user.username, user_path(model.user))
  end

  def check_model_has_categories
    if model.categories.any?
    end
  end

  def check_if_logged_in_and_has_privileges
    if logged_in? && (current_user == article.user || current_user.admin?)

    end
  end

  def pluralize_article_count
    pluralize(article.user.articles.count, "article") if article.user.articles
  end

  def link_to_editing_article_path
    link_to "Edit this article", edit_article_path(article), class: "btn btn-xs btn-primary"
  end

  def link_to_delete_article
    link_to "Delete this article", article_path(article), method: :delete,
            data: {confirm: "Are you sure you want to delete the article?"},
            class: "btn btn-xs btn-danger"
  end

  def link_to_create_article
    link_to "Create new article", new_article_path(article), class: "btn btn-xs btn-primary"
  end




  def link_to_view_article_path
    link_to "View all articles", articles_path, class: "btn btn-xs btn-success"
  end

  private
   def link_to_params(*params)
    link_to params
  end


end