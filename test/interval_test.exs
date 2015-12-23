defmodule IntervalTest do
  use ExUnit.Case, async: true

  alias Geom.Interval

  doctest Interval

  test "new without args creates empty Interval" do
    interval = Interval.new
    assert Interval.is_empty?(interval) == true
  end

  test "create Interval from point" do
    interval = Interval.new 5
    assert interval.min == 5 and interval.max == 5
  end

  test "create Interval from points" do
    interval = Interval.new 5, 10
    assert interval.min == 5 and interval.max == 10
  end

  test "interval with max larger than min is not empty" do
    assert Interval.new(5, 10) |> Interval.is_empty? == false
  end

  test "interval with max smaller than min is empty" do
    assert Interval.new(10, 5) |> Interval.is_empty?
  end

  test "empty interval never contains a point" do
    assert Interval.new |> Interval.contains?(5) == false
  end

  test "interval contains point when >= min and <= max" do
    assert Interval.new(5) |> Interval.contains?(5)
  end

  test "the intersection is the max of the mins and min of the maxs" do
    anchor = Interval.new(0, 10)
    assert Interval.new(5, 15) |> Interval.intersection(anchor) == Interval.new(5, 10)
    assert Interval.new(-5, 5) |> Interval.intersection(anchor) == Interval.new(0, 5)
  end

  test "the union is the min and max points" do
    a = Interval.new 5
    b = Interval.new 10
    assert a |> Interval.union(b) == Interval.new(5, 10)
  end

  test "length is difference between max and min" do
    assert Interval.new(2, 10) |> Interval.length == 8
  end
end
