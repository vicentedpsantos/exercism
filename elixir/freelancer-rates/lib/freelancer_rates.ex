defmodule FreelancerRates do
  @work_hours 8.0
  @billable_days 22

  def daily_rate(hourly_rate), do: @work_hours * hourly_rate

  def apply_discount(before_discount, discount) do
    before_discount * (100 - discount) / 100
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> Kernel.*(@billable_days)
    |> apply_discount(discount)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget
    |> Kernel./(daily_discounted_rate(hourly_rate, discount))
    |> Float.floor(1)
  end

  defp daily_discounted_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate
    |> apply_discount(discount)
  end
end
