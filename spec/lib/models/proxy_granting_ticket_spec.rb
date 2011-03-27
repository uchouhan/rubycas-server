require 'spec/spec_helper'

describe CASServer::Model::ProxyGrantingTicket, 'Associations' do
  it { should belong_to :service_ticket }
  
  it { should have_many :granted_proxy_tickets }
end

describe CASServer::Model::ProxyGrantingTicket, '#to_s' do
  let(:ticket) { 'test' }
  let(:proxy_granting_ticket) { CASServer::Model::ProxyGrantingTicket.new :ticket => ticket }

  it 'should delegate #to_s to #ticket' do
    proxy_granting_ticket.to_s.should == ticket
  end
end
