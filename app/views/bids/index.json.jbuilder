json.array!(@bids) do |bid|
  json.extract! bid, :id, :bid_value
  json.url bid_url(bid, format: :json)
end
