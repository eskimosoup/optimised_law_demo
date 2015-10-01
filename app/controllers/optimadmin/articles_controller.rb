module Optimadmin
  class ArticlesController < Optimadmin::ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    edit_images_for Article, [[:image, { index: ['fill', 316, 164], show: ['fill', 165, 135], activity_stream: ['fill', 199, 155] }]]

    def index
      @articles = Optimadmin::BaseCollectionPresenter.new(collection: Article.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15).order(date: :desc), view_template: view_context, presenter: Optimadmin::ArticlePresenter)
    end

    def show
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to articles_url, notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to articles_url, notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

  private


    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :summary, :image, :content, :date, :slug, :suggested_url, :display,
                                      :team_member_id, :article_category_id, service_ids: [])
    end
  end
end
