class BookCommentsController < ApplicationController
  # before_action :set_comment, only: %i[destroy]

 def create
  book = Book.find(params[:book_id])
  @comment = current_user.book_comments.build(book_comment_params)
  @comment.book_id = book.id
  @comment.save
  @book_comments = book.book_comments.includes(:user)
  # redirect_back(fallback_location: root_path)
 end

 def destroy
  @comment = BookComment.find(params[:book_id])
  @book = @comment.book
  @comment.destroy
  @book_comments = @book.book_comments.includes(:user) 
  # redirect_back(fallback_location: root_path)
  end

# def set_comment
#   @comment.destroy
# end

 private
 def book_comment_params
 	params.require(:book_comment).permit(:comment, :book_id, :user_id)
 end
end
