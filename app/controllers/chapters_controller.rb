class ChaptersController < ApplicationController
  before_action :fetch_book
  before_action :fetch_chapter, only:[:show, :destroy, :edit, :update]
  def index
  end
  def new
    @chapter = @book.chapters.new
  end

  def create
   @chapter =  @book.chapters.new(chapter_params)

   if @chapter.save
     redirect_to book_chapter_path(@book, @chapter)
   else
     render :new
   end

  end

  def show
  end

  def edit

  end

  def update
    if @chapter.update_attributes(chapter_params)
      redirect_to book_chapter_path(@book, @chapter), notice: "chapter updated succesfully"
    else
      render :edit
    end
  end

  def destroy
    @chapter.destroy
    redirect_to book_path(@book), notice: "Chapter deleted succesfully"

  end

  private
    def chapter_params
      params.require(:chapter).permit(:title, :notes)
    end

    def fetch_book
      @book = Book.find(params[:book_id])
    end

    def fetch_chapter
      @chapter = @book.chapters.find(params[:id])
    end


end
