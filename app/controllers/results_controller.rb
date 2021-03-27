class ResultsController < ApplicationController
  def index
    @salary = Salary.all
  end
end
