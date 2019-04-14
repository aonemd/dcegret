class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  prepend_view_path Rails.root.join("frontend")

  rescue_from StandardError do |e|
    Rails.logger.error "#{e.class}: #{e}"
    e.backtrace.take(15).each { |b| Rails.logger.error "  #{b}" }

    case e
    when ActiveRecord::RecordInvalid
      render status: :bad_request, json: { errors: e.record.errors.full_messages }
    else
      render status: :bad_request, json: { errors: [e.message] }
    end
  end
end
