class TopicsController < ApplicationController
  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @chat = Chat.find(params[:chat_id])
    @topic = @chat.build
  end

  def create
    @chat = Chat.find(params[:chat_id])
    @topic= Topic.create(topic_params)
    @topic.chat_id = @chat.id
    respond_to do |format|
      if @topic.save
        format.html { redirect_to :back, notice: 'Chat was successfully created.' }
      else
        format.html {  redirect_to :back }
      end
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
    respond_with(@topic)
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
  end

  private
    def set_topic
      @project = Project.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :information)
    end
end
