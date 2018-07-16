class UserDecorator < ApplicationDecorator
  include Draper::LazyHelpers
  delegate_all
  decorates :user

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def gravatar_for(user, options = {size: 80})

    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)

    size = options[:size]

    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

    image_tag(gravatar_url, alt: user.username, class: "img-circle")

  end






end
