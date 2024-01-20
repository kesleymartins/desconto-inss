class ProponentsController < ApplicationController
  before_action :set_proponent, only: %i[show edit update destroy]

  def index
    @proponents = Proponent.page(params[:page])
  end

  def show; end

  def new
    @proponent = Proponent.new
    @proponent.build_address
  end

  def edit; end

  def create
    @proponent = Proponent.new(proponent_params)

    if @proponent.save
      redirect_to @proponent, notice: 'Funcionário criado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @proponent.update(proponent_params)
      redirect_to @proponent, notice: 'Funcionário atualizado com sucesso!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @proponent.destroy

    redirect_to proponents_path, notice: 'Funcionário removido com sucesso!'
  end

  private

  def proponent_params
    params.require(:proponent).permit(
      :name,
      :cpf,
      :birthdate,
      :salary,
      :discount,
      address_attributes: %i[street district number zip_code city state]
    )
  end

  def set_proponent
    @proponent = Proponent.find(params[:id])
  end
end
