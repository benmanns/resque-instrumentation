Resque.redis = Redis.new(url: ENV[ENV["REDIS_PROVIDER"]]) if ENV["REDIS_PROVIDER"]
