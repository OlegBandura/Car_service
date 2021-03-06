module Admin
# Admin BreakCategoriesController
  class BreakCategoriesController < BaseController

    def index
      categories = BreakCategory.select_category_sub_category

      @categories = Hash.new { |hsh, key| hsh[key] = [] }
      categories.each do |c|
        @categories[c[:break_category_name]].push(c)
      end
    end

    def create
      BreakCategory.create(brake_category_params)
      redirect_to admin_break_categories_path
    end

    def edit
      @break_category = BreakCategory.find(params[:id])
    end

    def update
      @break_sub_category = BreakCategory.find(params[:id])
      if @break_sub_category.update(brake_category_params)
        redirect_to admin_break_categories_path
      else
        render action 'edit'
      end
    end

    def destroy
      break_category = BreakCategory.find(params[:id])
      break_category.destroy
      redirect_to admin_break_categories_path
    end

    private

    def brake_category_params
      params.require(:break_category).permit(:break_category_name)
    end
  end
end
