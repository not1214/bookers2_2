class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash.now[:notice] = "You have created book successfully"
      redirect_to book_path(book.id)
    else
      @books = Book.all
      flash.now[:alert] = "You have failed"
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      flash.now[:alert] = "不正なアクセスです"
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash.now[:notice] = "You have updated book successfully"
      redirect_to book_path(book)
    else
      flash.now[:alert] = "You have failed"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash.now[:notice] = "You have deleted book successfully"
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
