class Web::User::NotesControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get web_user_notes_path

    assert { response.status == 200 }
  end
end