require 'spec/spec_helper'

describe CASServer::Model::LoginTicket, '.cleanup(max_lifetime, max_unconsumed_lifetime)' do
  let(:max_lifetime) { -1 }
  let(:max_unconsumed_lifetime) { -2 }

  before do
    CASServer::Model::LoginTicket.delete_all

    CASServer::Model::LoginTicket.create :ticket => 'test', :client_hostname => 'test.local'
  end

  it 'should destroy all tickets created before the max lifetime' do
    expect {
      CASServer::Model::LoginTicket.cleanup(max_lifetime, max_unconsumed_lifetime)
    }.to change(CASServer::Model::LoginTicket, :count).by(-1)
  end

  it 'should destroy all unconsumed tickets not exceeding the max lifetime' do
    expect {
      CASServer::Model::LoginTicket.cleanup(max_lifetime, max_unconsumed_lifetime)
    }.to change(CASServer::Model::LoginTicket, :count).by(-1)
  end
end

describe CASServer::Model::LoginTicket, '#to_s' do
  let(:ticket) { 'test' }

  before do
    @login_ticket = CASServer::Model::LoginTicket.new :ticket => ticket
  end

  it 'should delegate #to_s to #ticket' do
    @login_ticket.to_s.should == ticket
  end
end

describe CASServer::Model::ServiceTicket, 'Associations' do
  it { should belong_to :granted_by_tgt }
  it { should have_one :proxy_granting_ticket }
end

describe CASServer::Model::TicketGrantingTicket, 'Associations' do
  it { should have_many :granted_service_tickets }
end

describe CASServer::Model::ProxyGrantingTicket, 'Associations' do
  it { should belong_to :service_ticket }
  it { should have_many :granted_proxy_tickets }
end
