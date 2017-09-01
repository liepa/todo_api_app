class Tag < ApplicationRecord
  has_and_belongs_to_many :tasks
  scope :for_task, ->(task_id) { joins(:tasks).where(tags_tasks: { task_id: task_id }) }
end
