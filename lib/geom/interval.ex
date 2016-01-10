defmodule Geom.Interval do
  alias __MODULE__

  @type t :: %Interval{min: number, max: number}
  defstruct min: 1, max: 0

  @spec new() :: Interval.t
  def new do
    %Interval{}
  end

  @spec new(number) :: Interval.t
  def new(num) when is_number(num) do
    %Interval{min: num, max: num}
  end

  @spec new(number, number) :: Interval.t
  def new(min, max) when is_number(min) and is_number(max) do
    %Interval{min: min, max: max}
  end

  @spec center(Interval.t) :: number
  def center(%Interval{min: min, max: max}) when min <= max do
    (max + min) * 0.5
  end

  @spec contains?(Integer.t, number) :: boolean
  def contains?(interval, num) when is_number(num) do
    case is_empty? interval do
      true -> false
      false -> num >= interval.min and num <= interval.max
    end
  end

  @spec intersection(Interval.t, Interval.t) :: Interval.t
  def intersection(%Interval{} = a, %Interval{} = b) do
    Interval.new max(a.min, b.min), min(a.max, b.max)
  end

  @spec is_empty?(Interval.t) :: boolean
  def is_empty?(%Interval{min: min, max: max}), do: min > max

  @spec length(Interval.t) :: number
  def length(%Interval{min: min, max: max}), do: max - min

  @spec union(Interval.t, Interval.t) :: Interval.t
  def union(%Interval{} = a, %Interval{} = b) do
    %Interval{min: min(a.min, b.min), max: max(a.max, b.max)}
  end
end
