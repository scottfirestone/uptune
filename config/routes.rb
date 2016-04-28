Rails.application.routes.draw do
  root                          to: "welcome#index"

  get "/auth/spotify",          as: :spotify_login
  get "/auth/spotify/callback", to: "sessions#create"
  delete "/logout",             to: "sessions#destroy"

  resources :playlist, only:[:show, :create]

  post "/playlist/add_track",       to: "playlist#add_track"
  post "/playlist/upvote_track",    to: "playlist#upvote_track"
  post "/playlist/complete",        to: "playlist#complete"
  get "/playlist/:code/play", to: "playlist/play#show", as: "playlist_play"

  resources :users, only:[] do
    resources :playlists, only:[:index, :show]
  end
end
