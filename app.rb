class App < Sinatra::Application
  require 'open-uri'

  get '/' do
    # send_file "https://#{params[:q]}"
    open("https://#{params[:q]}", &:read)
  end

  not_found do
    status 404
    'not found'
  end
end
