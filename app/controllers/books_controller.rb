class BooksController < ApplicationController
  before_action :book_find ,only: [:show , :edit ,:update ,:destroy]
  def index
    @books= Book.all
  end

  def show

  end

  def new
    @book = current_user.books.build
    #build books from user
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
    params.require(:book).permit(:title , :description ,:author)
  end

  def book_find
    @book = Book.find(params[:id])
  end
end
