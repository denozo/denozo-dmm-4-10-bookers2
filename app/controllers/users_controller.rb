class UsersController < ApplicationController


  def index
    @users = User.all
  end
  
  def new
    @book = Book.new  
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.book.page(params[:page]).reverse_order
  end

  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end