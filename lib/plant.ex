defmodule HappyPlant.Plant do
  use Timex

  defstruct height: 0, health: 3, last_watered: Timex.now()

  def create() do
    %HappyPlant.Plant{}
  end

  def create_at(timestamp) do
    %HappyPlant.Plant{last_watered: timestamp}
  end
end
