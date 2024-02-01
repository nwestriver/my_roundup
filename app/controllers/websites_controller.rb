class WebsitesController < ApplicationController
  #登録済みまとめサイトの一覧画面
  def index
    @websites = Website.all
  end

  #各まとめサイトの詳細画面
  def show
    @website = Website.find(params[:id])
  end

  def new
    @website = Website.new
  end

  def create  
    @website = Website.new(website_params)
    if @website.save
      #redirect_to @website
      redirect_to website_path(@website)
    else
      render :new
    end
  end

  def edit
    @website = Website.find(params[:id])
  end

  def update
    @website = Website.find(params[:id])
    if @website.update(website_params)
      redirect_to website_path(@website)
    else
      render :edit
    end
  end

  def destroy
    @website = Website.find(params[:id])
    @website.destroy
    redirect_to websites_path
  end

  private
  #ストロングパラメータ処理
  def website_params
    params.require(:website).permit(:title, :url)
  end
end
