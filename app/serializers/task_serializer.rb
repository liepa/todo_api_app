class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :tags do
    ::Tag.for_task(object.id)
  end
end
