json.array!(@asks) do |ask|
  json.extract! ask, :id, :title, :body, :user_id
  json.url ask_url(ask, format: :json)
end
