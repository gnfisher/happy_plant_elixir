defmodule HappyPlant do
  defmodule Plant do
    defstruct height: 0, health: 3, last_watered: DateTime.utc_now

    def create() do
      %HappyPlant.Plant{}
    end

    def create_at(timestamp) do
      %HappyPlant.Plant{last_watered: timestamp}
    end
  end
end
