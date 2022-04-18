defmodule Solfacil.Application do
  use Application

  alias Solfacil.Usuario

  def cadastrar_usuario(email, senha) do
    Usuario.usuario(email, senha)
  end

  @impl true
  def start(_type, _args) do
    children = [
      Solfacil.Repo,
      SolfacilWeb.Telemetry,
      {Phoenix.PubSub, name: Solfacil.PubSub},
      SolfacilWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Solfacil.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    SolfacilWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
