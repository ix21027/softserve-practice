class ApplicationController < ActionController::API
  include Pagy::Backend

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { errors: [exception.to_s] }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
    render json: { errors: resource.errors }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: { errors: "Not Found" }, status: :not_found
  end
end
