json.array!(@news) do |news|
  json.extract! news, :id, :content, :published
  json.url news_url(news, format: :json)
end
