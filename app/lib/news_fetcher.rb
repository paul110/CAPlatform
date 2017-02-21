class NewsFetcher

  def initialize
    @url = "https://newsapi.org/v1/articles"
    @apiKey = Rails.application.secrets.news_api_key
  end

  def update

  end

  def get_news source
    response = Faraday.get("#{@url}?source=#{source}&apiKey=#{@apiKey}").body
    response = JSON.parse(response)
    raise "News fetching went wrong" if response["status"] != "ok"
    response["articles"]
  end

end
