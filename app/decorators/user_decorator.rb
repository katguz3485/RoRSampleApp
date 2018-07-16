class UserDecorator < ApplicationDecorator
  include Draper::LazyHelpers
  delegate_all
  decorates :user
  decorates_associations :article

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end


  def link_to_edit_path
    link_to 'Edit', edit_user_path(user)
  end


  def link_to_back
    link_to 'Back', users_path
  end


end
