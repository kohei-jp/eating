class ShopsController < ApplicationController
  before_action :set_search, only: [:index, :result]
  before_action :set_results, only: [:index, :result]
  
 def index
 end

 def result
 end
 
 def show
  @shop = Shop.find(params[:id])
 end
 


 
 def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path, success:'登録が完了しました'
    else
      flash.now[:denger] = '登録に失敗しました'
      render :shop_edit_path
    end
 end

 def new
   @shop = Shop.new
 end
 
  def edit
    @shop = Shop.find(params[:id])
        if @shop.save
          # redirect_to root_path, success:'登録が完了しました'
        else
            flash.now[:denger] = '登録に失敗しました'
            render :edit
        end
  end
  
  def update
    @shop = Shop.find(params[:id])
    #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if shop == @shop
      # 右辺のshopが間違っている
      if @shop.update(shop_params)
        flash[:success] = 'お店情報を編集しました。'
        render :show
      else
        # binding.pry
        flash.now[:danger] = 'お店情報の編集に失敗しました。'
        render :edit
      end   
    else
        redirect_to root_url
    end
  end

 private
 def set_search
   @search = Shop.ransack(params[:q])
 end
 
 def set_results
   @results = @search.result(distinct:true)
 end
 
  def shop_params
    params.require(:shop).permit(:name, :genre, :info, :tell, :image, :image)
  end
  
end
