defmodule Geom.Rect do
  alias __MODULE__
  alias Geom.Interval

  defstruct x: %Interval{}, y: %Interval{}

  def new do
    %Rect{}
  end

  def new(%Interval{} = x, %Interval{} = y) do
      %Rect{x: x, y: y}
  end

  def union(%Rect{} = a, %Rect{} = b) do
    %Rect{x: Interval.union(a.x, b.x), y: Interval.union(a.y, b.y)}
  end
end
