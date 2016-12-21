defmodule Vivid.Line do
  alias Vivid.{Line, Point}
  defstruct ~w(origin termination)a
  import :math, only: [sqrt: 1, pow: 2]

  @moduledoc ~S"""
  Represents a line segment between two Points in 2D space.
  """

  @doc ~S"""
  Creates a Line.

  ## Example

      iex> Vivid.Line.init(Vivid.Point.init(1,1), Vivid.Point.init(4,4))
      %Vivid.Line{origin: %Vivid.Point{x: 1, y: 1}, termination: %Vivid.Point{x: 4, y: 4}}
  """
  def init(%Point{}=o, %Point{}=t) do
    %Line{origin: o, termination: t}
  end

  @doc ~S"""
  Returns the origin (starting) point of the line segment.

  ## Example

      iex> Vivid.Line.init(Vivid.Point.init(1,1), Vivid.Point.init(4,4)) |> Vivid.Line.origin
      %Vivid.Point{x: 1, y: 1}
  """
  def origin(%Line{origin: o}), do: o

  @doc ~S"""
  Returns the termination (ending) point of the line segment.

  ## Example

      iex> Vivid.Line.init(Vivid.Point.init(1,1), Vivid.Point.init(4,4)) |> Vivid.Line.termination
      %Vivid.Point{x: 4, y: 4}
  """
  def termination(%Line{termination: t}), do: t

  @doc ~S"""
  Calculates the X (horizontal) distance between the origin and termination points.

  ## Example

      iex> Vivid.Line.init(Vivid.Point.init(1,1), Vivid.Point.init(14,4)) |> Vivid.Line.x_distance
      13
  """
  def x_distance(%Line{origin: %Point{x: x0}, termination: %Point{x: x1}}), do: abs(x1 - x0)

  @doc ~S"""
  Calculates the Y (vertical) distance between the origin and termination points.

  ## Example

      iex> Vivid.Line.init(Vivid.Point.init(1,1), Vivid.Point.init(4,14)) |> Vivid.Line.y_distance
      13
  """
  def y_distance(%Line{origin: %Point{y: y0}, termination: %Point{y: y1}}), do: abs(y1 - y0)

  @doc ~S"""
  Calculates straight-line distance between the two ends of the line segment using
  Pythagoras' Theorem

  ## Example

      iex> Vivid.Line.init(Vivid.Point.init(1,1), Vivid.Point.init(4,5)) |> Vivid.Line.length
      5.0
  """
  def length(%Line{}=line) do
    dx2 = line |> x_distance |> pow(2)
    dy2 = line |> y_distance |> pow(2)
    sqrt(dx2 + dy2)
  end
end