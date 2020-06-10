class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comments_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog) }
      else
        format.html { redirect_to blog_path(@blog), notice: "投稿できませんでした。。。"}
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:blog_id, :content)
  end
end
