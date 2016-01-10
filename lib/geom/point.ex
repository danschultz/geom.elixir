defmodule Geom.Point do
  alias __MODULE__

  @type t :: %Point{x: number, y: number}
  defstruct x: 0, y: 0

  @spec new() :: Point.t
  def new do
    %Point{}
  end

  @spec new(number, number) :: Point.t
  def new(x, y) when is_number(x) and is_number(y) do
    %Point{x: x, y: y}
  end

  @spec add(Point.t, Point.t) :: Point.t
  def add(%Point{} = a, %Point{} = b) do
    %Point{x: a.x + b.x, y: a.y + b.y}
  end

  @spec subtract(Point.t, Point.t) :: Point.t
  def subtract(%Point{} = a, %Point{} = b) do
    %Point{x: a.x - b.x, y: a.y - b.y}
  end

  @spec add(Point.t, number) :: Point.t
  def scale(%Point{} = point, scale) do
    %Point{x: point.x * scale, y: point.y * scale}
  end
end
