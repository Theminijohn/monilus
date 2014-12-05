json.array!(@expenses) do |expense|
  json.extract! expense, :id, :description, :amount
  json.url expense_url(expense, format: :json)
end
