class ApplicationController < ApplicationController
  before_action :require_admin

  # Methods omitted

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

end