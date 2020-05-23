class Web::User::NotesController < Web::User::ApplicationController
  def index
    notes = current_user.notes
    render :index, locals: { notes: notes }, status: :ok
  end
end