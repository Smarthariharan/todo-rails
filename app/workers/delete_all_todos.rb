class DeleteAllTodos
include Sidekiq::Job

  def perform
    Todo.delete_all
  end
end
