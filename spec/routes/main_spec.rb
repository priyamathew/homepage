require 'spec_helper'

describe App do
  describe '/' do
    it 'should respond to GET' do
      get '/'
      last_response.should be_ok
    end
  end
end