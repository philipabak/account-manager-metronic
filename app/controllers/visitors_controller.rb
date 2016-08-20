require 'digest/md5'

class VisitorsController < ApplicationController
  before_filter :check_session

  def check_session
    if !session[:user_email]
      redirect_to signin_path
    end
  end

  def dashboard
      @title = 'User | Table'
      @user = User.find_by_email(session[:user_email])
      @reservation_list = Reservation.where(:location_id => @user.location_id)
      @location_list = Location.all
  end

  def profile
      @title = 'User | Profile'
      @user = User.find_by_email(session[:user_email])
      @location_list = Location.all
  end

  def create
    @reservation = Reservation.new(user_params)
    @user = User.find_by_email(session[:user_email])
    @reservation.location_id = @user.location_id

    if @reservation.save
      flash[:notice_type]    = 'success'
      flash[:notice_content] = 'Reservation has registered successfully.'

    else
      flash[:notice_type]    = 'danger'
      flash[:notice_content]  = 'Something went wrong!'
    end

    @title = 'User | Table'
    @reservation_list = Reservation.where(:location_id => @user.location_id)

    render 'visitors/dashboard'
      # redirect_to root_path

  end

  def user_params
    params.permit(:name, :arrival_time, :party_size)
  end

end
