class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success:'登録が完了しました'
    else
      flash.now[:denger] = '登録に失敗しました'
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
        if @user.save
          # redirect_to root_path, success:'登録が完了しました'
        else
            flash.now[:denger] = '登録に失敗しました'
            render :edit
        end

  end
  
  def update
    @user = User.find(params[:id])
    #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        render :show
      else
        # binding.pry
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end   
    else
        redirect_to root_url
    end
  end
  
   private
  def user_params
    params.require(:user).permit(:name, :email, :age, :live, :intro, :image, :password, :password_confirmation)
  end
  

end
