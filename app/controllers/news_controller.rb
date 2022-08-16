class NewsController < ApplicationController
  def index
    response = HTTP.get("https://newsapi.org/v2/everything?q=#{params[:search]}&from=2022-07-15&sortBy=publishedAt&apiKey=#{Rails.application.credentials.news_api_key}&langugage=en")
    articles = response.parse(:json)
    render json: articles.as_json
  end
end
