class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = 'You have created book successfully.'
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.new
    @book_id = Book.find(params[:id])
    @user = @book_id.user
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = 'You have updated book successfully.'
    redirect_to book_path(@book.id)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
