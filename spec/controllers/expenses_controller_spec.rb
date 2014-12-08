require 'rails_helper'

describe ExpensesController do
  
  login_user

  describe 'GET #index' do
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested expense to @expense' do
      expense = create(:expense)
      get :show, id: expense
      expect(assigns(:expense)).to eq expense
    end
    it 'renders the :show template' do
      expense = create(:expense)
      get :show, id: expense
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new Expense to @expense' do
      get :new
      expect(assigns(:expense)).to be_a_new(Expense)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested expense to @expense' do
      expense = create(:expense)
      get :edit, id: expense
      expect(assigns(:expense)).to eq expense
    end
    it 'renders the :edit template' do
      expense = create(:expense)
      get :edit, id: expense
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do

    # Wtf ->
    context 'with valid attributes' do
      it 'saves the new expense in the database'
      it 'redirects to expenses#show'
    end

    context 'with invalid attributes' do
      before :each do 
        post :create, expense: attributes_for(:invalid_expense)
      end

      it 'does not save the new expense in the database' do
        expect{
          post :create, expense: attributes_for(:invalid_expense)
        }.to_not change(Expense, :count)
      end

      it 're-renders the :new template' do
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do

    before :each do
      @expense = create(:expense,
        description: 'This is a Description',
        amount_cents: '100' 
      )
    end

    context 'with valid attributes' do
      it 'locates the requested @expense' do
        patch :update, id: @expense, expense: attributes_for(:expense)
        expect(assigns(:expense)).to eq(@expense)
      end

      it 'updates the expense in the database' do
        patch :update, id: @expense, expense: attributes_for(:expense, 
                                                description: "Changed Description") 
        @expense.reload
        expect(@expense.description).to eq('Changed Description')
      end

      it 'redirects to the expense' do
        patch :update, id: @expense, expense: attributes_for(:expense)
        expect(response).to redirect_to @expense
      end
    end

    context 'with invalid attributes' do
      it 'does not update the expense' do
        patch :update, id: @expense, expense: attributes_for(:invalid_expense)
        @expense.reload
        expect(@expense.amount_cents).to_not eq(0)
        expect(@expense.amount_cents).to eq(100) 
      end

      it 're-renders the :edit template'
    end
  end

  describe 'DELETE #destroy' do

    before :each do
      @expense = create(:expense)
    end

    it 'deletes the expense from the database' do
      expect{
        delete :destroy, id: @expense
      }.to change(Expense, :count).by(-1)
    end

    it 'redirects to expenses#index' do
      delete :destroy, id: @expense
      expect(response).to redirect_to expenses_url
    end
  end

end
