defmodule Geom.Point do
  alias __MODULE__
  
  defstruct x: 0, y: 0

  def new do
    %Point{}
  end

  def new(x, y) when is_number(x) and is_number(y) do
    %Point{x: x, y: y}
  end

  def add(%Point{} = a, %Point{} = b) do
    %Point{x: a.x + b.x, y: a.y + b.y}
  end

  def subtract(%Point{} = a, %Point{} = b) do
    %Point{x: a.x - b.x, y: a.y - b.y}
  end

  def scale(%Point{} = point, scale) do
    %Point{x: point.x * scale, y: point.y * scale}
  end
end
