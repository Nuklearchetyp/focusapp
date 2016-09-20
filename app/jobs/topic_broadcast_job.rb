class TopicBroadcastJob < ApplicationJob
  queue_as :default

  def perform(topic)
    ActionCable.server.broadcast "chats_#{topic.chat_id}_channel",  counter: render_topic(topic)
  end

  private

  def render_counter(topic)
    ApplicationController.render(partial: 'topics/topic', locals: { topic: topic })
  end
end
