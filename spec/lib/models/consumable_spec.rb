require 'spec/spec_helper'

class TestModel < ActiveRecord::Base
  set_table_name 'casserver_lt'

  include CASServer::Model::Consumable
end

describe TestModel, '.cleanup(max_lifetime, max_unconsumed_lifetime)' do
  let(:max_lifetime) { -1 }
  let(:max_unconsumed_lifetime) { -2 }

  before do
    TestModel.delete_all

    TestModel.create :ticket => 'test', :client_hostname => 'test.local'
  end

  it 'should destroy all tickets created before the max lifetime' do
    expect {
      TestModel.cleanup(max_lifetime, max_unconsumed_lifetime)
    }.to change(TestModel, :count).by(-1)
  end

  it 'should destroy all unconsumed tickets not exceeding the max lifetime' do
    expect {
      TestModel.cleanup(max_lifetime, max_unconsumed_lifetime)
    }.to change(TestModel, :count).by(-1)
  end
end
