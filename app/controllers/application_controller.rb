class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

   private

    def single_serializer
      ActiveModelSerializers::SerializableResource
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
