class ArticleDecorator < ApplicationDecorator
  include Draper::LazyHelpers
  delegate_all
  decorates :article
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

  def check_if_logged_in_and_user_privileges
    if logged_in? && (current_user == article.user || current_user.admin?)

    end
  end

  def link_to_article_editing_path
    link_to_params("Edit this article", edit_article_path(article))
  end


  private

  def link_to_params(*params)
    link_to params
  end


end