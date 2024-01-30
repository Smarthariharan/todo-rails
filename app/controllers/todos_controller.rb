class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @todos = Todo.all
    render json: { todos: ActiveModel::SerializableResource.new(@todos, each_serializer: TodoSerializer) }
    # render json: @todos, each_serializer: TodoSerializer, data: @todos
  end

  def show 
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  def create
    title = params[:todo][:title]
    @title = Todo.new(title:title)
    r_json = {}
    begin
      @title.save!
      render json: {todo: @title}, status: 200
    rescue => e
      r_json[:message] = e.message
      render json: {todo: r_json},  status: 400  
    
    end
    
  end

  def update
    @todo = Todo.find(params[:id])
    newTitle = params[:todo][:title]
    r_json = {}
    begin
      @todo.update!(title:newTitle) 
      render json: @todo, status: 200
    rescue => e
      r_json[:message] = e.message
      render json: r_json, status: 400
    end
  end

  def delete
    # raise "Sample Error"
    @todo = Todo.find(params[:id])
    @todo.delete
  end

  def delete_all_todos
  DeleteAllTodos.perform_async()
  render json: { message: 'Deletion job enqueued successfully'}
  end
end
