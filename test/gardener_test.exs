defmodule HappyPlant.GardenerTest do
  use ExUnit.Case
  use Timex

  doctest HappyPlant.Gardener

  describe "water/2" do
    test "deducts 1 health if less than 11 seconds have passed" do
      timestamp = Timex.now()
      three_seconds_from_now = Timex.shift(timestamp, seconds: 3)
      plant = HappyPlant.Plant.create_at(timestamp)

      result = HappyPlant.Gardener.water(plant, three_seconds_from_now)

      assert result.health == plant.health - 1
    end

    test "adds 1 health if between 10 and 16 seconds have passed" do
      timestamp = Timex.now
      thirteen_seconds_from_now = Timex.shift(timestamp, seconds: 13)
      plant = HappyPlant.Plant.create_at(timestamp)

      result = HappyPlant.Gardener.water(plant, thirteen_seconds_from_now)

      assert result.health == plant.health + 1
    end

    test "deducts 1 health for every interval of 15 seconds that have passed" do
      timestamp = Timex.now
      thirty_seconds_from_now = Timex.shift(timestamp, seconds: 45)
      plant = HappyPlant.Plant.create_at(timestamp)

      result = HappyPlant.Gardener.water(plant, thirty_seconds_from_now)

      assert result.health == plant.health - 3
    end
  end
end
