defimpl Vivid.Transformable, for: Vivid.Line do
  alias Vivid.{Line, Transformable, Point}

  @spec transform(Line.t, (Point.t -> Point.t)) :: Line.t
  def transform(line, fun) do
    origin = line |> Line.origin |> Transformable.transform(fun)
    term   = line |> Line.termination |> Transformable.transform(fun)
    Line.init(origin, term)
  end
end
