# uses https://newsapi.org/#apiArticles
class NewsFetcher

  URL = "https://newsapi.org/v1/articles"
  APIKEY = Rails.application.secrets.news_api_key

  def self.populate source
    articles = get_news source
    articles = articles.map { |a| {href: a["url"], title: a["title"]} }
    entry = ExternalDatum.find_by(source_type: source)
    if entry.present?
      ExternalDatum.update data: articles
    else
      ExternalDatum.create! source_type: source, name:"#{source} articles", url: '', data: articles
    end
  end

  def self.get_news source
    response = Faraday.get("#{URL}?source=#{source}&apiKey=#{APIKEY}").body
    response = JSON.parse(response)
    raise "News fetching went wrong" if response["status"] != "ok"
    response["articles"]
  end

end
