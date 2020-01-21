require 'rails_helper'

describe AnswerUser do
  it { should belong_to(:answer) }
  it { should belong_to(:user) }
end
