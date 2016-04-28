require "rails_helper"

RSpec.describe Users::PlaylistsController, type: :controller do
  describe "GET index" do
    it "renders the user's playlist index" do
      VCR.use_cassette("create_a_playlist") do
        user = create_authenticated_user
        playlist = PlaylistCreator.create_playlist(user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        get :index, { uid: user.uid }

        expect(response).to render_template(:index)
      end
    end
  end
end
