require 'rails_helper'

RSpec.describe UserTaskship, type: :model do
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:task_id) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:task) }
end
