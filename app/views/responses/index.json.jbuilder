json.array!(@responses) do |response|
  json.extract! response, :id, :message, :tweet_id, :user_id
  json.url response_url(response, format: :json)
end
