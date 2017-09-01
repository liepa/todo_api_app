class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  before_action :set_tags, only: :update

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def set_tags
    tags = params[:data][:attributes][:tags]
    return unless tags.present?

    tag_ids = []
    tags.each do |tag|
      tag_ids << Tag.find_or_create_by(title: tag).id
    end

    params[:data][:attributes][:tag_ids] = tag_ids
    @tag_ids = tag_ids
  end

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:data).permit(attributes: [ :title, tag_ids: [] ], tags: [])
  end
end
