class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    #find book throught book_id
    @comment = @book.comments.create(comment_params)
    #with each book ,we can create many comments

    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    #find book through book_id
    @comment = @book.comments.find(params[:id])
    #with each book we find comment to delete

    @comment.destroy
    redirect_to book_path(@book)
    #when comment was delete it'll go to books#show

  end

  private
  def comment_params
    params.require(:comment).permit(:commenter , :body)
  end
end
