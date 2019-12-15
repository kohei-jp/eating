class ShopsController < ApplicationController
  before_action :set_search, only: [:index, :result]
  before_action :set_results, only: [:index, :result]
  
  def index
     # 検索オブジェクト
    # @search = Shop.ransack(params[:q])
     # 検索結果を表示する@resultsオブジェクトを生成
    # @results = @search.result(distinct:true)
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
 
 def edit
  
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
