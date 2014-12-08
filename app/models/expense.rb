class Expense < ActiveRecord::Base
  
  # Associations
  belongs_to :user

  # Validations
  validates :user_id, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0  } 

  # Money
  monetize :amount_cents

  # Tags
  acts_as_taggable

end
