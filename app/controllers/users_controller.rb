class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render :show, success:'登録が完了しました'
    else
      flash.now[:denger] = '登録に失敗しました'
      render :new
    end
  end
  
   private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def show
    @user = User.find_by(params[:id])
    render :mypage
  end
  
end
