class SectionsController < ApplicationController
  before_action :fetch_chapter
  before_action :fetch_section, only: [:show, :edit, :update, :destroy]
  def index
  end

  def new
    @section = @chapter.sections.new
  end

  def create
    @section = @chapter.sections.new(section_params)
    if @section.save
      redirect_to book_chapter_section_path(@book, @chapter, @section),notice: "Section created succesfully"
    else
      render :new
    end
  end

  def show
  end
  def edit

  end
  def update
    if @section.update_attributes(section_params)
      redirect_to book_chapter_section_path(@book,@chapter,@section), notice: "Section updated succesfully"
    else
      render :edit
    end

  end

  def destroy
    @section.destroy
    redirect_to book_chapter_path(@book, @chapter), notice: "Section deleted succesfully"
  end


  private
    def fetch_chapter
      @book = Book.find(params[:book_id])
      @chapter = @book.chapters.find(params[:chapter_id])
    end

    def fetch_section
      @section = @chapter.sections.find(params[:id])

    end

    def section_params
      params.require(:section).permit(:title, :content)
    end
end
