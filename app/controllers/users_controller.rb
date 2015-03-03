class UsersController < ApplicationController
  before_action :set_role, only: [:assign_role, :withdraw_role]
  before_action :set_user, only: [:assign_role, :withdraw_role]

  def index
    redirect_to root_path, alert: "You do not have requried privilage to see the list of users." unless current_user.has_role?("ceo")
    @users = User.all
    @aveiro = "company"
  end

  def assign_role
    @user.roles.create(role: @role.to_sym)
    redirect_to users_path, notice: "Successfully added role #{@role} to #{@user.name}"
  end

  def withdraw_role
    @user.roles.where(role: Role.roles[@role]).first.destroy
    redirect_to users_path, notice: "Successfully removed role #{@role} from #{@user.name}"
  end

  private
  def set_role
    @role = params.require(:role)
  end
  def set_user
    @user = User.find params[:id]
  end
end