class SessionsController < ApplicationController
  
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password!'
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    @current_user = nil
    redirect_to root_path
  end

end
