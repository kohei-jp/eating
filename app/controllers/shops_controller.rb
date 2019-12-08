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
  shop = Shop.find(shop.id)
  # shop.shop_id = params[:shop_id]
 end

 

 private
 def set_search
   @search = Shop.ransack(params[:q])
 end
 
 def set_results
   @results = @search.result(distinct:true)
 end
end
