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
    sleep 10
  end

  class << self
    add_method_tracer :small
    add_method_tracer :medium
    add_method_tracer :big
  end
end
