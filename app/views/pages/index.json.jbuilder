json.array!(@pages) do |page|
  json.extract! page, :id, :amount
  json.url page_url(page, format: :json)
end
