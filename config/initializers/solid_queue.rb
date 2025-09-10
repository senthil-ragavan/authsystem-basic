if SolidQueue.respond_to?(:configure)
  SolidQueue.configure do |config|
    config.database = Rails.env.production? ? :queue : nil
  end
end
