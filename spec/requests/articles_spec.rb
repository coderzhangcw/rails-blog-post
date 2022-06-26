require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /articles" do
    it "get article list" do
      t1 = Tag.create! name: "python"
      t2 = Tag.create! name: "ruby"
      Article.create! title: "rspec test", content: "hello world", tag_ids: [t1.id, t2.id]
      get "/api/v1/article"
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      p json
      expect(json[0]["title"]).to eq "rspec test"
    end
    it "get article info" do
      t1 = Tag.create! name: "python"
      t2 = Tag.create! name: "ruby"
      a1 = Article.create! title: "rspec test", content: "hello world", tag_ids: [t1.id, t2.id]
      get "/api/v1/article/#{a1.id}"
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["title"]).to eq "rspec test"
    end
  end
  describe "POST /articles" do
    it "create new article" do
      t1 = Tag.create! name: "python"
      t2 = Tag.create! name: "ruby"
      params = {
        title: "rspec test",
        content: "Hello World!"
      }
      post '/api/v1/article', params: params.to_json, headers: {'ACCEPT' => 'application/json'}
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["title"]).to eq "rspec test"
    end
  end
  describe "PUT /articles" do
    it "update article" do
      t1 = Tag.create! name: "python"
      t2 = Tag.create! name: "ruby"
      a1 = Article.create! title: "rspec test", content: "hello world", tag_ids: [t1.id, t2.id]
      params = {
        title: "updated title",
        content: "updated content"
      }
      put "/api/v1/article/#{a1.id}", params: params.to_json, headers: {'ACCEPT' => 'application/json'}
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["title"]).to eq "updated title"
      expect(json["content"]).to eq "updated content"
    end
  end
  describe "DELETE /articles" do
    it "delete a article" do
      t1 = Tag.create! name: "python"
      t2 = Tag.create! name: "ruby"
      a1 = Article.create! title: "rspec test", content: "hello world", tag_ids: [t1.id, t2.id]
      delete "/api/v1/article/#{a1.id}"
      expect(response).to have_http_status(204)
    end
  end
end
