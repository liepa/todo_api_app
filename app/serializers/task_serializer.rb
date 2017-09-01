class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :tags, if: -> { should_render_association } do
    ::Tag.for_task(object.id)
  end

  def should_render_association
    return ::Tag.for_task(object.id).present?
  end
end
