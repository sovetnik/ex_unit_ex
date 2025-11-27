defmodule Test.Support.Named do
  use GenServer

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  def start_processes(names) do
    Enum.map(names, fn name -> start_process(name) end)
  end

  def stop_processes(names) do
    Enum.map(names, fn name -> stop_process(name) end)
  end

  def start_process(name) do
    GenServer.start(__MODULE__, [], name: name)
  end

  def stop_process(name) do
    case Process.whereis(name) do
      nil ->
        nil

      pid ->
        Process.exit(pid, :shutdown)
    end
  end
end
