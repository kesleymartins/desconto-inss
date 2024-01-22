module ProponentService
  extend self

  def report
    data = {}

    tax_ranges.each do |range|
      label = format('De %<start>.2f até %<end>.2f', start: range[:start], end: range[:end])
      data[label] = Proponent.count_by_salary_range(range[:start], range[:end])
    end

    data
  end

  def calculate_discount(salary:)
    discounts = []

    tax_ranges.each do |range|
      taxable_salary = [salary, range[:end]].min - range[:start]

      next if taxable_salary.negative?

      discounts << taxable_salary * range[:aliquot]
    end

    discounts.sum.round(2)
  end

  private

  def tax_ranges
    [
      { start: 0, end: 1045.00, aliquot: 0.075 },
      { start: 1045.00, end: 2089.60, aliquot: 0.09 },
      { start: 2089.60, end: 3134.40, aliquot: 0.12 },
      { start: 3134.40, end: 6101.06, aliquot: 0.14 }
    ]
  end
end
