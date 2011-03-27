require 'spec/spec_helper'

describe CASServer::Model::LoginTicket, '#to_s' do
  let(:ticket) { 'test' }
  let(:login_ticket) { CASServer::Model::LoginTicket.new :ticket => ticket }

  it 'should delegate #to_s to #ticket' do
    login_ticket.to_s.should == ticket
  end
end
