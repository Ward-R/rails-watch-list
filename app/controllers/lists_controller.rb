class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      # when it saves -> go to the restaurants show page
      redirect_to list_path(@list)
    else
      # when it doesnt save -> show the form again
      render 'new', status: :unprocessable_entity # throws a 422 (for Turbo)
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  private

  def list_params
    # Strong params -> white listing the attributes users can give us in the form
    params.require(:list).permit(:name, :photo)
  end
end



# Features

# Once again, you must have a precise idea of the features of your app in order to build your routes. Here is the list of features:

#     A user can see all the lists

# GET "lists"

#     A user can see the details of a given list and its name

# GET "lists/42"

#     A user can create a new list

# GET "lists/new"
# POST "lists"
