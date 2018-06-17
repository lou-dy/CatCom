class MaleBettumChannel < ApplicationCable::Channel
  def subscribed
    stream_from "male_bettum_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
