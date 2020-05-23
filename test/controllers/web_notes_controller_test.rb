class Web::NotesControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get '/web/notes'

    assert { response.status == 200 }
  end
end