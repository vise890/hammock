get '/' do
  content_type :json
  Coconut.first.to_json
end

