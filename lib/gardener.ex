defmodule HappyPlant.Gardener do
  def water(plant, timestamp) do
    plant
    |> lt_11_seconds_since(timestamp)
    |> bw_10_and_16_seconds(timestamp)
    |> gt_15_seconds(timestamp)
  end

  defp add_health(plant) do
    struct(plant, %{health: plant.health + 1})
  end

  defp deduct_health(plant) do
    struct(plant, %{health: plant.health - 1})
  end

  defp lt_11_seconds_since(plant, timestamp) do
    if Timex.diff(timestamp, plant.last_watered, :seconds) < 11 do
      plant |> deduct_health
    else
      plant
    end
  end

  defp bw_10_and_16_seconds(plant, timestamp) do
    if Timex.diff(timestamp, plant.last_watered, :seconds) > 10 &&
      Timex.diff(timestamp, plant.last_watered, :seconds) < 16 do
      plant |> add_health
    else
      plant
    end
  end

  defp gt_15_seconds(plant, timestamp) do
    time_diff = Timex.diff(timestamp, plant.last_watered, :seconds)
    if time_diff > 15 do
      deduct = div(time_diff, 15)
      Enum.reduce 1..deduct, plant, fn _, acc -> acc |> deduct_health end
    else
      plant
    end
  end
end
