defmodule RectTest do
  use ExUnit.Case

  alias Geom.Rect
  alias Geom.Interval
  alias Geom.Point

  doctest Rect

  test "center is top left point plus half dimensions" do
    rect = Rect.new Interval.new(10, 20), Interval.new(10, 20)
    assert rect |> Rect.center == Point.new(15, 15)
  end

  test "intersection is the overlap of two rects" do
    rect1 = Rect.new Interval.new(10, 20), Interval.new(10, 20)
    rect2 = Rect.new Interval.new(15, 25), Interval.new(15, 25)
    expect = Rect.new Interval.new(15, 20), Interval.new(15, 20)
    assert Rect.intersection(rect1, rect2) == expect
  end

  test "union is min top left and max bottom right of two rect" do
    rect1 = Rect.new Interval.new(10, 20), Interval.new(10, 20)
    rect2 = Rect.new Interval.new(15, 25), Interval.new(15, 25)
    expect = Rect.new Interval.new(10, 25), Interval.new(10, 25)
    assert Rect.union(rect1, rect2) == expect
  end

end
