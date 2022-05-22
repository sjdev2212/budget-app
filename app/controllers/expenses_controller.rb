class ExpensesController < ApplicationController
  def index
    @expenses = Expense.where(user_id: current_user.id)
    # @cat = @expenses.category_id
  end
  def new
    @expense = Expense.new
  end
  def create
    # expense  = current_user.categories.expenses.new(exp_params)
@current_user = User.find(params[:user_id])
@user_id = params[:user_id]
@cat_id = params[:category_id]
expense = Expense.new(exp_params.merge(user_id: @current_user.id, category_id: @cat_id))
    if expense.save
  redirect_to category_expenses_path
  flash[:success] = 'Expense added!'
else
  redirect_to   new_category_expense_path
  flash[:error] = 'ERROR! Expense was not added.'
end
  end

  private
  def exp_params
  params.require(:expense).permit(:name, :amount)
  end


end
