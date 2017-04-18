module Messages
 
 def get_messages(page_number)
    response = self.class.get("https://www.bloc.io/api/v1/message_threads", body: { page: page_number }, headers: {"authorization" => @auth_token})
    @message_page = JSON.parse(response.body, symbolize_names: true)
 end
 
 def create_message(sender, recipient_id, subject, stripped_text)
    response = self.class.post("https://www.bloc.io/api/v1/messages", body: { "sender" => sender, "recipient_id" => recipient_id, "subject" => subject, "stripped-text" => stripped_text }, headers: {"authorization" => @auth_token})
    puts response
 end
end 