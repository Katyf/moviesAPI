class UsersController < ApplicationController
  # The following line forces authentication for all of the following actions
  # You may want to limit that to specific actions with only: [:action_name_1, :action_name_2] as an argument
  before_filter :authenticate, only: [:index]

  def sign_in
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { token: user.token }
    else
      head :unauthorized
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {token: @user.token}
    else
      render json: {message: 'failed', status: 500}
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :token)
  end
end
