class Api::V1::ArticleController < ApplicationController
    def index
        # 列表api/v1/article
        @articles = Article.all
        render json: @articles
    end

    def show
        # 详情api/v1/article/2
        @article = Article.find(params[:id])
        render json: @article
    end

    def create
        body = request.raw_post
        data_parsed = JSON.parse(body)
        tag_ids = data_parsed["tag_ids"]
        @article = Article.create(data_parsed)
        
        if !tag_ids.nil?
            @article.tags << Tag.find(tag_ids)
        end
        render json: @article
    end

    def update
        body = request.raw_post
        data_parsed = JSON.parse(body)
        @article = Article.find(params[:id])
        @article.update(data_parsed)
        @article.reload
        render json: @article
    end

    def destroy
        Article.destroy(params[:id])
        TagArticle.where(article_id: params[:id]).destroy_all
    end
end
