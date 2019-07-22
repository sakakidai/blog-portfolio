module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[name avatar top_image remove_top_image remove_avatar]
    )
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[name avatar top_image color remove_top_image
               remove_avatar website bio]
    )
  end
end
