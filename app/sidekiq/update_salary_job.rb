class UpdateSalaryJob
  include Sidekiq::Job

  def perform(id, salary)
    discount = ProponentService.calculate_discount(salary:)

    proponent = Proponent.find(id)

    proponent.update(salary:, discount:)

    Turbo::StreamsChannel.broadcast_update_to(
      :salary_data,
      target: 'salary-data',
      partial: 'proponents/salary_data',
      locals: { proponent: }
    )

    Turbo::StreamsChannel.broadcast_update_to(
      :salary_form,
      target: 'salary-form',
      partial: 'proponents/salary_update_form',
      locals: { proponent: }
    )
  end
end
