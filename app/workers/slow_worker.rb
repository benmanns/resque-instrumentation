require "new_relic/agent/method_tracer"

class SlowWorker
  @queue = :slow

  include ::NewRelic::Agent::MethodTracer

  def self.perform
    big
    5.times do
      small
    end
    medium
  end

  def self.small
    sleep 1
  end

  def self.medium
    sleep 5
  end

  def self.big
    trace_execution_scoped(['Custom/big/a']) do
      sleep 2
    end
    trace_execution_scoped(['Custom/big/b']) do
      sleep 3
    end
    sleep 2
    trace_execution_scoped(['Custom/big/c']) do
      sleep 3
    end
  end

  class << self
    add_method_tracer :small
    add_method_tracer :medium
    add_method_tracer :big
  end
end
