get '/' do
  # La siguiente linea hace render de la vista 
  # que está en app/views/index.erb
  puts "Este es un GET a (/)"
  puts "Esto es lo que vale Params: #{params.inspect}"
  erb :index
end

get '/cool_url' do
  puts "Este es un GET a /cool_url"
  puts "Esto es lo que vale Params: #{params.inspect}"
  erb :get_cool_url # Esto renderea una vista llamada get_cool_url.erb
end

post '/cool_url' do
  puts "Este es un POST a /cool_url"
  puts "Esto es lo que vale Params: #{params.inspect}"
  erb :post_cool_url # Esto renderea una vista llamada post_cool_url.erb
end