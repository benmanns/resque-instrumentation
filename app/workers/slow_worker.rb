class SlowWorker
  @queue = :slow

  def self.perform
    sleep 10
    5.times do
      sleep 1
    end
    sleep 5
  end
end
