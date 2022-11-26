class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  private

  def rescue_record_not_found(invalid)
    render json: {error: "#{invalid.model} not found"}, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
