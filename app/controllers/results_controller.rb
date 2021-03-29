class ResultsController < ApplicationController
  before_action :set_item, only: :destroy

  def index
    @salary = Salary.all
  end

  def destroy
    @salary.destroy
    redirect_to root_path
  end



  private
  def set_salary
    @salary = Salary.find(params[:id])
  end
end
