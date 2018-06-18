class MaleBettumChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "male_bettum_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen(data)
    stop_all_streams
    stream_for data["male_bettum_id"]
  end
end
