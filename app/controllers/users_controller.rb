require 'digest/md5'

class UsersController < ApplicationController

  def signin
    if session[:user_email]
      redirect_to root_path
    else
      @location_list = Location.all
      @title = 'User | Sign In'
    end
  end

  def do_signin
    email = params[:email]
    password = Digest::MD5.hexdigest(params[:password])
    location_id = params[:location_id]
    @user = User.where(:email => email, :password => password, :location_id => location_id).first
    if @user.nil?
      flash[:notice_type]    = 'danger'
      flash[:notice_content]  = 'Invalid email or password'

      redirect_to root_path
    else
      flash[:notice_type]    = 'success'
      flash[:notice_content]  = 'You are now signed in.'

      session[:user_email] = @user.email

      redirect_to root_path
    end
  end

  def signout
    session.delete(:user_email)

    flash[:notice_type]    = 'success'
    flash[:notice_content]  = 'You are now signed out.'
    redirect_to root_path
  end

  def check_user
    email = params[:email]
    password = Digest::MD5.hexdigest(params[:password])
    location_id = params[:location_id]
    @user = User.where(:email => email, :password => password, :location_id => location_id).first
    if @user.nil?
      @user = User.new
      @user.email = 'null'
    end
    render json: @user
  end

end
