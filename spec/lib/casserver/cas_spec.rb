require 'spec/spec_helper'

class TestController
  include CASServer::CAS
end

describe TestController, '#generate_login_ticket' do
  before do
    subject.stub(:hostname).and_return 'http://test.local'
  end

  it 'should generate a login ticket' do
    lambda {
      subject.generate_login_ticket
    }.should change(CASServer::Model::LoginTicket, :count).by(1)
  end
end

describe TestController, '#generate_ticket_granting_ticket(username, extra_attributes = {})' do
  let(:username) { 'test' }

  before do
    subject.stub(:hostname).and_return 'http://test.local'
  end

  it 'should generate a login ticket' do
    lambda {
      subject.generate_ticket_granting_ticket(username)
    }.should change(CASServer::Model::TicketGrantingTicket, :count).by(1)
  end
end

describe TestController, '#generate_service_ticket(service, username, tgt)' do
  let(:service) { 'http://test.local' }
  let(:username) { 'test' }
  let(:tgt) { CASServer::Model::TicketGrantingTicket.create :username => username, :ticket => 'test', :client_hostname => service }

  before do
    subject.stub(:hostname).and_return service
  end

  it 'should generate a login ticket' do
    lambda {
      subject.generate_service_ticket(service, username, tgt)
    }.should change(CASServer::Model::ServiceTicket, :count).by(1)
  end
end
