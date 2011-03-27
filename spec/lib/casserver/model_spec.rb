require 'spec/spec_helper'

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
