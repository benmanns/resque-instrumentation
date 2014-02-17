class SlowWorker
  @queue = :slow

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
end
