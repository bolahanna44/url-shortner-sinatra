class App < Sinatra::Application
  post '/urls' do
    @url = Url.new(original_url: params[:original_url])

    if @url.save
      @url.to_json
    else
      status 400
      { errors: @url.errors.full_messages }.to_json
    end
  end

  get '/:short_url' do
    url = Url.find_by(short_url: params[:short_url])
    url.present? ? redirect(url.original_url) : render(not_found)
  end

  not_found do
    status 404
    'not found'
  end
end
