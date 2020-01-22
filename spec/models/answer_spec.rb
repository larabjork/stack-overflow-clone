require 'rails_helper'

describe Answer do
  it { should belong_to(:question) }
  it { should have_many(:users).through(:answer_users)}
end
