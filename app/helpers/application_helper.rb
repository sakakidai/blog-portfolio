module ApplicationHelper

  def action_new
    controller.action_name == 'new'
  end

  def action_edit
    controller.action_name == 'edit'
  end

  def controller_home
    controller.controller_name == 'home'
  end

  def controller_blogs_renders
    (controller.action_name == 'create' ||
      controller.action_name == 'update') &&
      controller.controller_name == 'blogs'
  end

  def controller_registrations_renders
    (controller.action_name == 'create' ||
      controller.action_name == 'update') &&
      controller.controller_name == 'registrations'
  end

  def controller_categories_renders
    (controller.action_name == 'create' ||
      controller.action_name == 'update') &&
      controller.controller_name == 'categories'
  end

  def controller_action_selects
    action_new || action_edit || controller_home ||
      controller_blogs_renders || controller_registrations_renders ||
      controller_categories_renders
  end

  def user_and_blog_show
    (controller.controller_name == 'users' ||
      controller.controller_name == 'blogs') &&
      controller.action_name == 'show'
  end

  def controller_users
    controller.controller_name == 'users'
  end

  def prefered_color
    return current_user.color if user_signed_in? && current_user.color.present?

    '#525252'
  end

  def br(str)
    html_escape(str).to_str.gsub(/\R/, '<br />').html_safe
  end

end
