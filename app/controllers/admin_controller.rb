class AdminController < ApplicationController
  before_action :grant_admins_only_acess

  def grant_admins_only_acess
    if current_user.role != 'ADMIN'
      redirect_to root_path,
      notice: 'Admin rules required to perform this action'
    end
  end

  def users
    @users = User.all;
  end
end
