class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_params)
    if user && user.authenticate(password_params[:password])
      log_in user
      redirect_to :user , success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  #   private
  # def user_params
  # params.require(:user).permit(:session,:password)
  # end
  
  def destroy
    log_out
    redirect_to root_url, info: "ログアウトしました"
  end
  
 private
 def email_params
  params.require(:session).permit(:email)
 end
 
  private
  def password_params
   params.require(:session).permit(:password)
  end 


 private
 def log_in(user)
   session[:user_id] = user.id
 end
 
 def log_out
   session.delete(:user_id)
   @current_user = nil
 end
end