class CategoryDecorator < ApplicationDecorator
  include Draper::LazyHelpers
  delegate_all
  decorates :category
  decorates_associations :article, :article_category
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
  def pluralize_category_count
    pluralize(category.articles.count, "article")
  end

  def link_to_category_path
    link_to "#{category.name}", category_path(category)
  end


end
