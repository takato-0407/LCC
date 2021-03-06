class SalariesController < ApplicationController
  before_action :set_item, only: :destroy

  def index
  end

  def new
    @salary = Salary.new
  end

  def create
    @salary = Salary.new(salary_params)
    if @salary.valid?
      @salary.save
      redirect_to  results_path
    else
      render :new
    end
  end

  def destroy
    @salary.destroy
    redirect_to root_path
  end

  private
  def salary_params
    params.require(:salary).permit(:money, :food_expenses, :expenses).merge(user_id: current_user.id)
  end

  def set_salary
    @salary = Salary.find(params[:id])
  end
end

