defmodule VegaLiteSegfaultWeb.SegFaultExampleLive.Index do
  use VegaLiteSegfaultWeb, :live_view
  alias VegaLite, as: Vl

  @impl true
  def mount(_params, _session, socket) do
    plot =
      get_plot_values()
      |> make_plot()

    {
      :ok,
      socket
      # |> assign(:plot, plot)
    }
  end

  @impl true
  def handle_params(_, _, socket) do
    {:noreply, socket}
  end

  defp get_plot_values() do
    [
      %{"time" => 1_734_713_489, "value" => 120.0},
      %{"time" => 1_734_713_519, "value" => 121.0},
      %{"time" => 1_734_713_549, "value" => 122.0},
      %{"time" => 1_734_713_579, "value" => 123.0},
      %{"time" => 1_734_713_609, "value" => 125.0},
      %{"time" => 1_734_713_639, "value" => 127.0},
      %{"time" => 1_734_713_669, "value" => 130.0},
      %{"time" => 1_734_713_699, "value" => 128.5},
      %{"time" => 1_734_713_729, "value" => 127.0},
      %{"time" => 1_734_713_759, "value" => 135.0},
      %{"time" => 1_734_713_789, "value" => 134.0}
    ]
  end

  defp make_plot(values) do
    Vl.new(width: 400, height: 400)
    |> Vl.data_from_values(values)
    |> Vl.mark(:line, interpolate: "linear", point: true)
    |> Vl.encode_field(:x, "time", type: :quantitative)
    |> Vl.encode_field(:y, "value", type: :quantitative)
    |> VegaLite.Convert.to_svg()
  end
end
