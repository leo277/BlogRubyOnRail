class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    #need to create this new empty object for the user to 
    #fill in and this post variable can be used by the 
    #views/posts/new.html.erb
    @post = Post.new
  end

  #no view 
  def create   
    #@post = Post.create(post_params)
    @post = Post.new(post_params)

    if @post.save
      #posts_path is the post/index page, and flash notice display
      redirect_to posts_path, :notice => "Your post was saved"
      #flash message is valid for 1 request, refresh page will 
      #not render it again
      #edit the layouts/application.html.erb to include the 
      #flash notice to be displayed
    else
      #if fail, render the new page so that user can submit agin
      render "new"
    end
  end

  def edit
    #pass in a post to be edited 
    @post = Post.find(params[:id])

  end


  #no view
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_update_params)
      redirect_to posts_path, :notice => "Your post has been updated"
    else
      render "edit"
    end
  end

  #no view
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Your post has been deleted"
  end


  private

  def post_params
    params.require(:post).permit(:title, :content)
    #require a :post from the URL, similar to 
    #params[:post]
  end

  #permit only content to be changed
  #modification to the title will not be updated in db
  def post_update_params
    params.require(:post).permit(:content)
  end
end
