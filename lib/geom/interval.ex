defmodule Geom.Interval do
  alias __MODULE__

  defstruct min: 1, max: 0

  def new do
    %Interval{}
  end

  def new(num) when is_number(num) do
    %Interval{min: num, max: num}
  end

  def new(min, max) when is_number(min) and is_number(max) do
    %Interval{min: min, max: max}
  end

  def center(%Interval{min: min, max: max}) when min <= max do
    (max + min) * 0.5
  end

  def contains?(%Interval{} = interval, num) when is_number(num) do
    case is_empty? interval do
      true -> false
      false -> num >= interval.min and num <= interval.max
    end
  end

  def intersection(%Interval{} = a, %Interval{} = b) do
    Interval.new max(a.min, b.min), min(a.max, b.max)
  end

  def is_empty?(%Interval{min: min, max: max}), do: min > max

  def length(%Interval{min: min, max: max}), do: max - min

  def union(%Interval{} = a, %Interval{} = b) do
    %Interval{min: min(a.min, b.min), max: max(a.max, b.max)}
  end
end
