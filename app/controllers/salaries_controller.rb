class SalariesController < ApplicationController
  def calculate_discount
    salary = params[:salary].to_f

    discount = DiscountService.calculate(salary: salary)

    render json: { discount: discount }
  end
end
