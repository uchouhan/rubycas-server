require 'spec/spec_helper'

describe CASServer::Model::TicketGrantingTicket, 'Associations' do
  it { should have_many :granted_service_tickets }
end

describe CASServer::Model::TicketGrantingTicket, '#to_s' do
  let(:ticket) { 'test' }
  let(:ticket_granting_ticket) { CASServer::Model::TicketGrantingTicket.new :ticket => ticket }

  it 'should delegate #to_s to #ticket' do
    ticket_granting_ticket.to_s.should == ticket
  end
end
