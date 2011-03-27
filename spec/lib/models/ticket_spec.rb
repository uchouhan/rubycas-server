require 'spec/spec_helper'

class TestTicketModel < CASServer::Model::Ticket
  set_table_name 'casserver_lt'
end

describe TestTicketModel, '#to_s' do
  let(:ticket) { 'test' }
  let(:test_model) { TestTicketModel.new :ticket => ticket }

  it 'should delegate #to_s to #ticket' do
    test_model.to_s.should == ticket
  end
end
