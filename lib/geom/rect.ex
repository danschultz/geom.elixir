defmodule Geom.Rect do
  alias __MODULE__
  alias Geom.Interval
  alias Geom.Point

  defstruct x: %Interval{}, y: %Interval{}

  def new do
    %Rect{}
  end

  def new(%Interval{} = x, %Interval{} = y) do
    %Rect{x: x, y: y}
  end

  def from_points(points) do
    points
    |> Enum.map(fn point -> %Rect{
      x: %Interval{min: point.x, max: point.x},
      y: %Interval{min: point.y, max: point.y}} end)
    |> Enum.reduce(&union(&1, &2))
  end

  def top_left(%Rect{x: x, y: y}) do
    %Point{x: x.min, y: y.min}
  end

  def bottom_right(%Rect{x: x, y: y}) do
    %Point{x: x.max, y: y.max}
  end

  def center(%Rect{x: x, y: y}) do
    %Point{x: Interval.center(x), y: Interval.center(y)}
  end

  def intersection(%Rect{} = a, %Rect{} = b) do
    %Rect{x: Interval.intersection(a.x, b.x), y: Interval.intersection(a.y, b.y)}
  end

  def union(%Rect{} = a, %Rect{} = b) do
    %Rect{x: Interval.union(a.x, b.x), y: Interval.union(a.y, b.y)}
  end
end
