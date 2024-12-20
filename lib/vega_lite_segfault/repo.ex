defmodule VegaLiteSegfault.Repo do
  use Ecto.Repo,
    otp_app: :vega_lite_segfault,
    adapter: Ecto.Adapters.Postgres
end
