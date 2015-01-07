require_relative '../spec_helper.rb'

describe 'Main Test' do
  it 'responds' do
    get '/'
    last_response.status.must_equal 200
    assert_equal 'It works', last_response.body
  end
end