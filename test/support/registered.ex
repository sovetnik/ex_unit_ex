defmodule Test.Support.Registered do
  @moduledoc false
  use GenServer

  @impl true
  def init(value) do
    {:ok, value}
  end

  def start_processes(registry, names) do
    Enum.map(names, fn name -> start_link(registry, name) end)
  end

  def stop_processes(registry, names) do
    Enum.map(names, fn name -> stop_process(registry, name) end)
  end

  def start_link(registry, name) do
    GenServer.start(__MODULE__, nil, name: {:via, Registry, {registry, name}})
  end

  def stop_process(registry, name) do
    case Registry.lookup(registry, name) do
      [{pid, nil}] ->
        Process.exit(pid, :shutdown)

      _ ->
        nil
    end
  end
end
