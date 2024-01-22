class UpdateSalaryJob
  include Sidekiq::Job

  def perform(id, salary)
    discount = ProponentService.calculate_discount(salary:)

    proponent = Proponent.find(id)

    proponent.update(salary:, discount:)

    update_salary_data(proponent:)
    updaet_salary_form(proponent:)
  end

  private

  def updaet_salary_form(proponent:)
    Turbo::StreamsChannel.broadcast_update_to(
      :salary_form,
      target: 'salary-form',
      partial: 'proponents/salary_update_form',
      locals: { proponent: }
    )
  end

  def update_salary_data(proponent:)
    Turbo::StreamsChannel.broadcast_update_to(
      :salary_data,
      target: 'salary-data',
      partial: 'proponents/salary_data',
      locals: { proponent: }
    )
  end
end
