class SalariesController < ApplicationController
  def calculate_discount
    salary = params[:salary].to_f

    discount = ProponentService.calculate_discount(salary:)

    render json: { discount: }
  end
end
