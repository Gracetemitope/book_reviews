class CategoriesController < ApplicationController
  before_action only: %i[show]

  def index
    @featured = Review.find(featured) if Review.exists?(id: featured)

    @categories = Category.all
  end

  def show
    @reviews = Category.find(params[:id]).reviews.order('id DESC')
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def featured
    highest = Vote.group(:review_id).order('count_id DESC').limit(1).count(:id)
    highest.keys.first
  end

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
