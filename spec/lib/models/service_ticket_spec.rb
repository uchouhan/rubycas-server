require 'spec/spec_helper'

describe CASServer::Model::ServiceTicket, 'Associations' do
  it { should belong_to :granted_by_tgt }

  it { should have_one :proxy_granting_ticket }
end

describe CASServer::Model::ServiceTicket, '#to_s' do
  let(:ticket) { 'test' }
  let(:service_ticket) { CASServer::Model::ServiceTicket.new :ticket => ticket }

  it 'should delegate #to_s to #ticket' do
    service_ticket.to_s.should == ticket
  end
end

describe CASServer::Model::ServiceTicket, '#matches_service?(service)' do
  let(:ticket) { 'test' }
  let(:service) { 'http://test.local' }
  let(:service_ticket) { CASServer::Model::ServiceTicket.new :ticket => ticket, :service => service }

  it 'should return false for an unassociated service' do
    service_ticket.matches_service?('http://admin.local').should == false
  end

  it 'should return true for an associated service' do
    service_ticket.matches_service?(service).should == true
  end
end
