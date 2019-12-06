class ShopsController < ApplicationController
  def index
    #検索オブジェクト
    @search = Shop.ransack(params[:q])
    # @search.build_condition if @search.conditions.empty?
    #検索結果を表示する@resultsオブジェクトを生成
    @results = @search.result(distinct:true)
  end

 def show
      @search = Shop.ransack(params[:q])
    # @search.build_condition if @search.conditions.empty?
    #検索結果を表示する@resultsオブジェクトを生成
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
