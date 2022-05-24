class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all.where(user_id: current_user.id)

  end
  def show
     @expense = Expense.find(params[:id])
  end
  def new
    @expense = Expense.new
  end
  def create
    @new_expense = Expense.new(exp_params)

if @new_expense.save
  redirect_to category_path(id: params[:category_id]), notice: 'Transaction successfully added'
else
  render :new, alert: 'Oops, Something went wrong'
end

  end

  private
  def exp_params
  params.require(:expense).permit(:name, :amount, :user_id,:category_id )
  end


end
