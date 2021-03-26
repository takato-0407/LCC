class SalariesController < ApplicationController
  def new
    @salary = Salary.new
  end

  def create
    Salary.create(salary_params)
  end

  private
  def salary_params
    params.permit(:money, :food_expenses, :expenses).merge(user_id: current_user.id)
  end
end

