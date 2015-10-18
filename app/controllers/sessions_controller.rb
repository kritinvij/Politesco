class SessionsController < ApplicationController
  def create
    reddit.sign_in params[:username], params[:password]
    redirect_to root_path
  end

  def destroy
    reddit.sign_out
    redirect_to root_path
  end
end