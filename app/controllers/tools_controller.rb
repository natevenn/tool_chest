class ToolsController < ApplicationController
  def index
    @tools = current_user.tools
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
    @category = Category.all
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      current_user.tools << @tool
      flash[:notice] = "You have successfully created a tool"
      session[:most_recent_tool_id] = @tool.id
      redirect_to tool_path(@tool.id)
    else
      flash[:error] = @tool.errors.full_messages.join(", ")
      redirect_to new_tool_path
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
   if  @tool.update(tool_params)
     flash[:notice] = "You have successfully updated a tool"
     redirect_to @tool
   else
     flash[:error] = @tool.errors.full_messages.join(", ")
     redirect_to edit_tool_path(@tool)
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_path
  end

    private
    def tool_params
    params.require(:tool).permit(:name, :quantity, :price, :category_id)
    end
end

