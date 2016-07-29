class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  # GET /chats/1/edit
  def edit
  end

  def show
    @project = Project.find(params[:project_id])
    @chat = Chat.includes(:messages).find_by(id: params[:id])
    @message = Message.new
    @topic = Topic.new
    if @chat.project.moderator.id == current_user.id
      render "moderatorshow"
    elsif @chat.project.users.include?(current_user)
      render "participantshow"
    else
      redirect_to project_path(@chat.project)  
    end
  end

  # GET /chats/new
  def new
    @project = Project.find(params[:project_id])
    @chat = @project.chat.build
    respond_with(@chat)
  end

  # POST /chats
  # POST /chats.json
  def create
    @project = Project.find(params[:project_id])
    @chat = @project.create_chat(params[:deadline])
    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:deadline,  topic_attributes: [:title])
    end
end
