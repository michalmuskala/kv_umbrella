defmodule KV.Bucket.Supervisor do
  # A simple module attribute that stores the supervisor name
  @name KV.Bucket.Supervisor

  def child_spec(opts) do
    DynamicSupervisor.child_spec(KV.Bucket, [name: @name] ++ opts)
  end

  def start_bucket do
    DynamicSupervisor.start_child(@name, [])
  end
end
