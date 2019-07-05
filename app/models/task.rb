class Task < ApplicationRecord
  before_validation :generate_id, on: :create

  validates_uniqueness_of :taskid
  validates_presence_of :taskid, :topic, :status, :priority
  validate :end_time_after_start_time
  belongs_to :category, optional: true
  has_many :user_taskships
  has_many :users, :through => :user_taskships
  has_many :tag_taskships
  has_many :tags, :through => :tag_taskships

  def end_time_after_start_time
    if self.end_time.present? && self.start_time.present?
      if self.end_time <= self.start_time   
        errors[:end_time] <<  I18n.t("task.end_time_after_start_time") 
      end
    end
  end

  private
  def generate_id
    self.taskid = SecureRandom.uuid
  end

end
