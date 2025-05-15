class BookmarksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(strong_params)
    @bookmark.list = @list
    if @bookmark.save
      # when it saves -> go to the restaurants show page
      redirect_to list_path(@list)
    else
      # when it doesnt save -> show the form again
      render 'list/show', status: :unprocessable_entity # throws a 422 (for Turbo)
    end
  end

   private

  def strong_params
    # Strong params -> white listing the attributes users can give us in the form
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

# 4 - Routing, Controller, Views for bookmarks

#     A user can add a new bookmark (movie/list pair) to an existing list
#     Check out simple_form docs about f.association to easily create a select dropdown for our list of movies.

# GET "lists/42/bookmarks/new"
# POST "lists/42/bookmarks"

#     A user can delete a bookmark from a list. How can we make a delete link again?

# DELETE "bookmarks/25"
