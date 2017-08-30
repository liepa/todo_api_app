class ApplicationController < ActionController::API
  after_action :set_content_type

  def set_content_type
    self.content_type = "application/vnd.api+json; charset=utf-8"
  end
end
