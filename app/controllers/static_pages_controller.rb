class StaticPagesController < ApplicationController
def home
    if signed_in?
 #	redirect to tenders as a default    
      redirect_to tenders_path
/      @micropost  = current_user.microposts.build 
    @feed_items = current_user.feed.paginate(page: params[:page]) */
    end
  end


  def help
  end

  def about
  end

  def contact
  end
end
