class App
  get '/' do
    haml :index
  end

  get '/projects' do 
  	haml :projects
  end
  
end
