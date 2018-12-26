defmodule HappyPlant do
  defmodule Plant do
    use Timex

    defstruct height: 0, health: 3, last_watered: Timex.now()

    def create() do
      %HappyPlant.Plant{}
    end

    def create_at(timestamp) do
      %HappyPlant.Plant{last_watered: timestamp}
    end

    # Watering Rules:
    # ===============
    # If it has been 10 seconds or less? deduct a health.
    # If it has been between 10 and 16 seconds? add a health.
    # If it has been more than 15 seconds? deduct a health for every interval of
    # 15 seconds that have passed.
    def water(plant, timestamp) do
      plant
      |> lt_11_seconds_since(timestamp)
      |> bw_10_and_16_seconds(timestamp)
      |> gt_15_seconds(timestamp)
    end

    def add_health(plant) do
      struct(plant, %{health: plant.health + 1})
    end

    def deduct_health(plant) do
      struct(plant, %{health: plant.health - 1})
    end

    def lt_11_seconds_since(plant, timestamp) do
      if Timex.diff(timestamp, plant.last_watered, :seconds) < 11 do
        plant |> deduct_health
      else
        plant
      end
    end

    def bw_10_and_16_seconds(plant, timestamp) do
      if Timex.diff(timestamp, plant.last_watered, :seconds) > 10 &&
           Timex.diff(timestamp, plant.last_watered, :seconds) < 16 do
        plant |> add_health
      else
        plant
      end
    end

    def gt_15_seconds(plant, timestamp) do
      time_diff = Timex.diff(timestamp, plant.last_watered, :seconds)
      if time_diff > 15 do
        deduct = div(time_diff, 15)
        Enum.reduce 1..deduct, plant, fn _, acc -> acc |> deduct_health end
      else
        plant
      end
    end
  end
end
