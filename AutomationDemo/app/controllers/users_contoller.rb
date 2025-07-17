class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      # Enqueue the job to run in the background
      SendWelcomeEmailJob.perform_later(@user.id)
      redirect_to @user, notice: 'User created successfully! Welcome email will be sent shortly.'
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end