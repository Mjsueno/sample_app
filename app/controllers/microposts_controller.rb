class MicropostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @microposts.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  
  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
  def destroy
    @micropost.destroy
    redirect_to root_url
  end


    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end