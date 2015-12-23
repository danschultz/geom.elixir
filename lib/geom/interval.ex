defmodule Geom.Interval do
  alias __MODULE__

  defstruct min: 1, max: 0

  def new do
    %Interval{}
  end

  def new(point) when is_number(point) do
    %Interval{min: point, max: point}
  end

  def new(min, max) when is_number(min) and is_number(max) do
    %Interval{min: min, max: max}
  end

  def is_empty?(%Interval{min: min, max: max}), do: min > max

  def contains?(%Interval{} = interval, point) when is_number(point) do
    case is_empty? interval do
      true -> false
      false -> point >= interval.min and point <= interval.max
    end
  end

  def intersection(%Interval{} = a, %Interval{} = b) do
    Interval.new max(a.min, b.min), min(a.max, b.max)
  end

  def union(%Interval{} = a, %Interval{} = b) do
    %Interval{min: min(a.min, b.min), max: max(a.max, b.max)}
  end

  def length(%Interval{min: min, max: max}), do: max - min
end
