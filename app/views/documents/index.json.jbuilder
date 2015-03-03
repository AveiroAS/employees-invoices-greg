json.array!(@documents) do |document|
  json.extract! document, :id, :user_id, :file_name, :file_uid, :name, :description, :amount, :approved
  json.url document_url(document, format: :json)
end
