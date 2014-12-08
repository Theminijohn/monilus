require 'rails_helper'

describe Expense do

  it 'has a valid factory' do
    expect(build(:expense)).to be_valid
  end

  it 'is invalid without an amount' do
    expense = build(:expense, amount_cents: nil)
    expect(expense).not_to be_valid
  end

  it 'is invalid without an user_id' do
    expense = build(:expense, user_id: nil)
    expect(expense).not_to be_valid
  end
end
