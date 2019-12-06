class ShopsController < ApplicationController
  before_action :set_search, only: [:index, :show]
  before_action :set_results, only: [:index, :show]
  
  def index
     #検索オブジェクト
    #@search = Shop.ransack(params[:q])
     #検索結果を表示する@resultsオブジェクトを生成
    #@results = @search.result(distinct:true)
  end

 def show
    #@search = Shop.ransack(params[:q])
     #検索結果を表示する@resultsオブジェクトを生成
    #@results = @search.result(distinct:true)
 end
 
 private
 def set_search
   @search = Shop.ransack(params[:q])
 end
 
 def set_results
   @results = @search.result(distinct:true)
 end

  # def search
  #   @q = Shop.search(search_params)
  #   @shops = @q.result(distinct: true)
  # end
  
  # private
  # def search_params
  #   params.require(:q).permit!
  # end
end
