json.array!(@chats) do |chat|
  json.extract! chat, :id, :deadline
  json.url chat_url(chat, format: :json)
end
