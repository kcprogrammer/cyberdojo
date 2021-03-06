require File.dirname(__FILE__) + '/../test_helper'
require './integration_test'

class DiffControllerTest < IntegrationTest

  test "show" do
    id = checked_save_id
    avatar = Avatar.names[0]
    
    post '/kata/edit', {
      :id => id,
      :avatar => avatar
    }
    
    post 'kata/run_tests', {
      :id => id,
      :avatar => avatar,
      :file_content => { }
    }
    
    get "diff/show", {
      :id => id,
      :avatar => avatar,
      :was_tag => 0,
      :now_tag => 1
    }
    assert_response :success
  end
  
end

