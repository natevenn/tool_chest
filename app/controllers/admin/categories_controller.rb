class Admin::CategoriesController < Admin::BaseController

  def index

  end

  def new
    @categories = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category
      session[:most_recent_category_name] = @category.name
      redirect_to admin_category_path(@category)
    else
      render :new
    end
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
