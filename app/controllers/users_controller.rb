class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index

    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def edit
  end

  def create
    params.permit!
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to  "#{users_url}", notice: 'Contact was successfully created.' }
      else
        format.html { redirect_to  "#{users_url}", alert: @user.errors.full_messages.join('. ') }
      end
    end
  end

  def update
    @user.update(user_params)
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      #params.require(:user).permit(:email, :crypted_password, :salt)
      params.require(:user).permit(:email, :password, :password_confirmation)
    end



end
