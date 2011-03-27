require 'spec/spec_helper'

describe CASServer::Model::ProxyTicket, 'Associations' do
  it { should belong_to :granted_by_pgt }
end

describe CASServer::Model::ProxyTicket, '#to_s' do
  let(:ticket) { 'test' }
  let(:proxy_ticket) { CASServer::Model::ProxyTicket.new :ticket => ticket }

  it 'should delegate #to_s to #ticket' do
    proxy_ticket.to_s.should == ticket
  end
end
