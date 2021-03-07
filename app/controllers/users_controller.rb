class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    # p "-----------------------"
    # p @user
    # current_user.idは、idだけを渡しなさい、という意味になる。全部を渡すには.idをつけないで使う。
  end


  def show
    @user = User.find(params[:id])
    @booknew = Book.new
  end


  def edit
    @user = User.find(params[:id])
    # 先に代入する
    if @user == current_user
    # 代入した@userが、current_userならば、
      render "edit"
      # editを出す
    else
      redirect_to user_path(current_user.id)
      # 違う場合は、current_userのidでuser_path;editを出す
    end
  end


  # def new
  #   @user = User.new
  # end

  # ----------feedback below----------
  
    # usersコントローラに関して、newアクションは今回使用していないので不要です。


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "users/edit"
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
