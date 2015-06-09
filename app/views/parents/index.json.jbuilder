json.array!(@parents) do |parent|
  json.extract! parent, :id, :name, :email, :kid
  json.url parent_url(parent, format: :json)
end
