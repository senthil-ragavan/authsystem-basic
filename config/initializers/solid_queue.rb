SolidQueue.configure do |config|
  config.database = Rails.env.production? ? :queue : nil
end
