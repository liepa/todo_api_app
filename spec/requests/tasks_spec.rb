require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  def valid_task_list_json(title)
    {
      "data": [
        {
          "type": "tasks",
          "attributes": {
            "title": title
          }
        }
      ]
    }
  end

  def valid_task_create_json(title)
    {
      "data": {
        "type": "tasks",
        "attributes": {
          "title": title
        }
      }
    }
  end

  let(:header) { { "ACCEPT": "application/json" } }

  before(:each) do
    @task = Task.create!(title: "Task1")
  end

  describe "GET /api/v1/tasks" do
    it "returns tasks list" do
      get tasks_path
      expect(response).to have_http_status(200)
      expect(response.body).to have_json_size(1).at_path("data")
      expect(response.body).to be_json_eql(valid_task_list_json(@task.title).to_json)
    end
  end

  describe "POST /api/v1/tasks" do
    it "creates task" do
      title = "Clean house"
      post tasks_path, params: { data: { type: "undefined", id: "undefiined", attributes: { title: title }} }, headers: header
      expect(response).to have_http_status(201)
      expect(response.body).to have_json_size(3).at_path("data")
      expect(response.body).to be_json_eql(valid_task_create_json(title).to_json)
    end
  end

  describe "PATCH /api/v1/tasks/:id" do
    let(:task) { Task.create!(title: "Task1") }

    it "creates task" do
      title = "Updated Clean house"
      patch task_path(task), params: { data: { type: "undefined", id: "undefiined", attributes: { title: title }} }, headers: header
      expect(response).to have_http_status(200)
      expect(response.body).to have_json_size(3).at_path("data")
      expect(response.body).to be_json_eql(valid_task_create_json(title).to_json)
    end
  end
end
