require 'rails_helper'

RSpec.describe "Tags", type: :request do
  describe "GET /tags" do
    it "get tag list" do
      Tag.create! name: "python"
      Tag.create! name: "java"
      Tag.create! name: "javascript"
      Tag.create! name: "ruby"
      get '/api/v1/tag'
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json[0]["name"]).to eq "python"
      expect(json[1]["name"]).to eq "java"
      expect(json[2]["name"]).to eq "javascript"
      expect(json[3]["name"]).to eq "ruby"
    end
    it "get tag info" do
      tag = Tag.create! name: "python"
      get "/api/v1/tag/#{ tag.id }"
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["name"]).to eq "python"
    end
  end
  describe "POST /tags" do
    it "create new tag" do
      post '/api/v1/tag', params: {name: "ruby"}.to_json, headers: {'ACCEPT' => 'application/json'}
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["name"]).to eq "ruby"
    end
  end
  describe "PUT /tags" do
    it "update tag name" do
      tag = Tag.create! name: "python"
      put "/api/v1/tag/#{ tag.id }", params: {name: "ruby"}.to_json, headers: {'ACCEPT' => 'application/json'}
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["name"]).to eq "ruby"
    end
  end
  describe "DELETE /tags" do
    it "delete tag" do
      tag = Tag.create! name: "python"
      delete "/api/v1/tag/#{ tag.id }"
      expect(response).to have_http_status(204)
    end
  end
end
