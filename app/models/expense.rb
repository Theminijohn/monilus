class Expense < ActiveRecord::Base
  
  # Associations
  belongs_to :user

  # Validations
  validates :user_id, presence: true

  # Money
  monetize :amount_cents

end
