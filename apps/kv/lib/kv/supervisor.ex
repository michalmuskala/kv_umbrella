defmodule KV.Supervisor do
  def child_spec(opts) do
    children = [
      {KV.Registry, name: KV.Registry},
      KV.Bucket.Supervisor,
      {Task.Supervisor, name: KV.RouterTasks}
    ]
    Supervisor.child_spec(children, [strategy: :rest_for_one] ++ opts)
  end
end
