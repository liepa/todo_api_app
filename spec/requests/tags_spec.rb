require 'rails_helper'

RSpec.describe "Tags", type: :request do
  let(:header) { { "ACCEPT": "application/json" } }

  before(:each) do
    @tag = Tag.create!(title: "Tag1")
  end

  describe "GET /api/v1/tags" do
    it "returns tags list" do
      get tags_path
      expect(response).to have_http_status(200)
      expect(response.body).to have_json_size(1).at_path("data")
      expect(response.body).to be_json_eql(valid_list_json(type: "tags", title: @tag.title).to_json)
    end
  end

  describe "POST /api/v1/tags" do
    it "creates tag" do
      title = "Clean house"
      post tags_path, params: { data: { type: "undefined", id: "undefiined", attributes: { title: title }} }, headers: header
      expect(response).to have_http_status(201)
      expect(response.body).to have_json_size(3).at_path("data")
      expect(response.body).to be_json_eql(valid_create_json(type: "tags", title: title).to_json)
    end
  end

  describe "PATCH /api/v1/tags/:id" do
    it "creates tag" do
      title = "Updated Clean house"
      patch tag_path(@tag), params: { data: { type: "undefined", id: "undefiined", attributes: { title: title }} }, headers: header
      expect(response).to have_http_status(200)
      expect(response.body).to have_json_size(3).at_path("data")
      expect(response.body).to be_json_eql(valid_create_json(type: "tags", title: title).to_json)
    end
  end

  describe "DELETE /api/v1/tags/:id" do
    it "creates tag" do
      delete tag_path(@tag), params: { data: { type: "tags", id: @tag.id } }, headers: header
      expect(response).to have_http_status(204)
    end
  end
end
