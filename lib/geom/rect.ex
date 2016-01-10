defmodule Geom.Rect do
  alias __MODULE__
  alias Geom.Interval
  alias Geom.Point

  @type t :: %Rect{x: Interval.t, y: Interval.t}
  defstruct x: %Interval{}, y: %Interval{}

  @spec new() :: Rect.t
  def new do
    %Rect{}
  end

  @spec new(Interval.t, Interval.t) :: Rect.t
  def new(%Interval{} = x, %Interval{} = y) do
    %Rect{x: x, y: y}
  end

  @spec from_points([Point.t]) :: Rect.t
  def from_points(points) do
    points
    |> Enum.map(fn point -> %Rect{
      x: %Interval{min: point.x, max: point.x},
      y: %Interval{min: point.y, max: point.y}} end)
    |> Enum.reduce(&union(&1, &2))
  end

  @spec top_left(Rect.t) :: Point.t
  def top_left(%Rect{x: x, y: y}) do
    %Point{x: x.min, y: y.min}
  end

  @spec bottom_right(Rect.t) :: Point.t
  def bottom_right(%Rect{x: x, y: y}) do
    %Point{x: x.max, y: y.max}
  end

  @spec center(Rect.t) :: Point.t
  def center(%Rect{x: x, y: y}) do
    %Point{x: Interval.center(x), y: Interval.center(y)}
  end

  @spec intersection(Rect.t, Rect.t) :: Rect.t
  def intersection(%Rect{} = a, %Rect{} = b) do
    %Rect{x: Interval.intersection(a.x, b.x), y: Interval.intersection(a.y, b.y)}
  end

  @spec union(Rect.t, Rect.t) :: Rect.t
  def union(%Rect{} = a, %Rect{} = b) do
    %Rect{x: Interval.union(a.x, b.x), y: Interval.union(a.y, b.y)}
  end
end
