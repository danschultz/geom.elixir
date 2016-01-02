defmodule RectTest do
  use ExUnit.Case

  alias Geom.Rect
  alias Geom.Interval
  alias Geom.Point

  doctest Rect

  test "from_points/1 returns rectangle from list of points" do
    rect = Rect.from_points [
      Point.new(5, 10), Point.new(-10, -5), Point.new(0, 0), Point.new(5, 5)
    ]
    assert rect == Rect.new Interval.new(-10, 5), Interval.new(-5, 10)
  end

  test "top_left/1 is the top left corner" do
    rect = Rect.new Interval.new(10, 20), Interval.new(20, 30)
    assert rect |> Rect.top_left == Point.new(10, 20)
  end

  test "bottom_right/1 is the top left corner" do
    rect = Rect.new Interval.new(10, 20), Interval.new(20, 30)
    assert rect |> Rect.bottom_right == Point.new(20, 30)
  end

  test "center/1 is top left point plus half dimensions" do
    rect = Rect.new Interval.new(10, 20), Interval.new(10, 20)
    assert rect |> Rect.center == Point.new(15, 15)
  end

  test "intersection/2 is the overlap of two rects" do
    rect1 = Rect.new Interval.new(10, 20), Interval.new(10, 20)
    rect2 = Rect.new Interval.new(15, 25), Interval.new(15, 25)
    expect = Rect.new Interval.new(15, 20), Interval.new(15, 20)
    assert Rect.intersection(rect1, rect2) == expect
  end

  test "union/2 is min top left and max bottom right of two rect" do
    rect1 = Rect.new Interval.new(10, 20), Interval.new(10, 20)
    rect2 = Rect.new Interval.new(15, 25), Interval.new(15, 25)
    expect = Rect.new Interval.new(10, 25), Interval.new(10, 25)
    assert Rect.union(rect1, rect2) == expect
  end

end
