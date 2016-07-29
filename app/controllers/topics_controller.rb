class TopicsController < ApplicationController
  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
    respond_with(@topic)
  end

  def create
    @topic = Topic.create(topic_params)
    @topic.save
    respond_with(@topic)
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
      params.require(:topic).permit(:title)
    end
end
