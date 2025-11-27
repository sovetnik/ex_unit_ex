defmodule Test.Support.TestRegistry do
  def wait_for_registry(name) do
    case Registry.start_link(keys: :unique, name: name) do
      {:ok, pid} when is_pid(pid) -> pid
      _ -> wait_for_registry(name)
    end
  end
end
