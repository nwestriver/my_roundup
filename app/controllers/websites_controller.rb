class WebsitesController < ApplicationController
  #登録済みまとめサイトの一覧画面
  def index
    @user = User.find(params[:user_id])
    
    #@websites = Website.all
  end

  #各まとめサイトの詳細画面
  def show
    @user = User.find(params[:user_id])
    @website = @user.websites.find(params[:id])
    #@website = Website.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    #@website = Website.new
  end

  def create  
    @user = User.find(params[:user_id])
    @website = @user.websites.new(website_params)
    #@website = Website.new(website_params)
    if @website.save
      #redirect_to @website
      flash[:notice] = "新しいサイトを登録しました。"
      redirect_to user_website_path(@user, @website)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @website = @user.websites.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @website = @user.websites.find(params[:id])
    if @website.update(website_params)
      flash[:notice] = "サイト情報を修正しました。"
      redirect_to user_website_path(@user, @website)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @website = @user.websites.find(params[:id])
    @website.destroy
    flash[:notice] = "サイト情報を削除しました。"
    redirect_to user_websites_path(@user)
  end

  private
  #ストロングパラメータ処理
  def website_params
    params.require(:website).permit(:title, :url, :user_id)
  end

end
