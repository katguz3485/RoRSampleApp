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



end