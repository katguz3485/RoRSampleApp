class CommentDecorator < ApplicationDecorator
  include Draper::LazyHelpers
  delegate_all
  decorates :comment
  decorates_associations :article, :user
  decorates_finders

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
