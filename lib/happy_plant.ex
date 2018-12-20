defmodule HappyPlant do
  defmodule Plant do
    defstruct height: 0, health: 3

    def create() do
      %HappyPlant.Plant{}
    end
  end
end
