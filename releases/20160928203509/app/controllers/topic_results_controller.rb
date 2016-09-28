class TopicResultsController < ApplicationController
  def show
    @topic_result = TopicResult.find(params[:id])
  end

  def new
    @chat = Chat.find(params[:chat_id])
    @topic_result = @chat.build
  end

  def create
    @chat = Chat.find(params[:chat_id])
    @topic_result= TopicResult.create(topic_result_params)
    respond_to do |format|
      if @topic_result.save
        format.html { redirect_to :back, notice: 'Result was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def topic_result_params
      params.require(:topic_result).permit(:results, :topic_id)
    end
end
