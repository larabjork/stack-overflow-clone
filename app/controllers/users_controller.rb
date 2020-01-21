class UsersController < ApplicationController

  def index
     @users = User.all
     render :index
   end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def edit
    @album = Album.find(params[:id])
     render :edit
 end

 def show
   @album = Album.find(params[:id])
    render :show
 end

 def update
   @album= Album.find(params[:id])
    if @album.update(album_params)
      redirect_to albums_path
    else
      render :edit
    end
 end

 def destroy
   @album = Album.find(params[:id])
     @album.destroy
     redirect_to albums_path
 end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
