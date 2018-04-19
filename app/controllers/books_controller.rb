class BooksController < ApplicationController
  before_action :book_find ,only: [:show , :edit ,:update ,:destroy]
  def index
     if params[:category].blank?
     @books= Book.all.page(params[:page])
     else
      @category = Category.find_by(name: params[:category])
      @books = Book.where(:category_id => @category).page(params[:page])
     end
  end

  def show

  end

  def new
    @book = current_user.books.build
  end

  def create

    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @book.update(book_params)
        redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title , :description ,:author ,:category_id ,:book_img)
  end

  def book_find
    @book = Book.find(params[:id])
  end
end
