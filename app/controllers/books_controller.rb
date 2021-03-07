class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render "books/index"
    end
  end


  def show
    @book = Book.find(params[:id])
    # @books = Book.all
    @booknew = Book.new
    # @user = current_user
  end

  # ----------feedback below----------

  # ・コントローラ内に不要なコードがあります。booksコントローラのshowアクションで、
  # @books = Book.allという記述がありますが、showアクションは本の詳細画面に渡す変数を定義すれば良いので、
  # この変数は不要です。
  #PS: @userも不要。show画面で使われていない引数。@book.user.idで紐づけたデータが呼び出されている


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  def edit
      @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render 'books/edit'
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
