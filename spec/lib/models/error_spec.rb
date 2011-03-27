require 'spec/spec_helper'

describe Error, '#to_s' do
  let(:message) { 'Message' }
  let(:error) { Error.new('Test', message) }

  it 'should return the error message' do
    error.to_s.should == message
  end
end
