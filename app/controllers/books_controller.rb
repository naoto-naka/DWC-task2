class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all.order(id: "asc")
  	@book = Book.new
  end

  def create
  book = Book.new(book_params)
  book.save
  flash[:notice] = "Book was successfully created."
  redirect_to book_path(book)
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	@book.update(book_params)
  	@book.save
  	flash[:notice] = "Book was successfully updated."
  	redirect_to book_path
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice] = "Book was successfully destroyed."
  	redirect_to books_path
  end


  private
  def book_params
  params.require(:book).permit(:title,:body)
  end
end
