class PhoneNumbersController < ApplicationController
  before_action :set_proponent
  before_action :set_phone_number, only: %i[destroy]

  def new
    @phone_number = PhoneNumber.new
  end

  def create
    @phone_number = PhoneNumber.new(phone_number_params)
    @phone_number.proponent = @proponent

    if @phone_number.save
      turbo_stream
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @phone_number.destroy

    turbo_stream
  end

  private

  def phone_number_params
    params.require(:phone_number).permit(:number)
  end

  def set_phone_number
    @phone_number = PhoneNumber.find(params[:id])
  end

  def set_proponent
    @proponent = Proponent.find(params[:proponent_id])
  end
end
