require 'test_helper'

class Web::User::NotesControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get web_user_notes_path

    assert { response.status == 200 }
    assert { response.body.match('Hello') }
  end
end