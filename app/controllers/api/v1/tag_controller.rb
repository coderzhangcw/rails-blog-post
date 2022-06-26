class Api::V1::TagController < ApplicationController
    def index
        # 列表api/v1/tag
        p 'tag index'
        @tags = Tag.all
        render json: @tags
    end

    def show
        # 详情api/v1/tag/2
        p 'tag show'
        @tag = Tag.find(params[:id])
        render json: @tag
    end

    def create
        p 'tag create'
        body = request.raw_post
        p body
        data_parsed = JSON.parse(body)
        @tag = Tag.create(data_parsed)
        render json: @tag
    end

    def update
        p 'tag update'
        
        body = request.raw_post
        data_parsed = JSON.parse(body)
        @tag = Tag.find(params[:id])
        @tag.update(data_parsed)
        @tag.reload
        render json: @tag
    end

    def destroy
        p 'tag destroy'
        @tag = Tag.destroy(params[:id])
        TagArticle.where(tag_id: params[:id]).destroy_all
    end
end
