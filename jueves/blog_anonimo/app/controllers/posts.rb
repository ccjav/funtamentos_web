get '/new' do
  erb :create
end

post '/new' do
  @blog_post = Post.new(title: params[:post_title], author: params[:post_author], body: params[:post_body])
  
  if @blog_post.save
    params[:post][:tags].split(", ").each do |x|
      exists = Tag.find_by(tag: x)
      if exists
        @blog_post.taggings.create(tag: exists)
      else
        @tag = Tag.new(tag: x)
        @blog_post.taggings.create(tag: @tag)
      end
    end

    redirect to ("/new")
  else
    # @error = @url.errors.messages[:url]
    # if @error[0] == "is invalid"
    #   @error = "Url inválida. No olvide iniciar con 'http'"
    # end
    # erb :index
  end  
end

get '/posts' do
  @all_posts = Post.all
  # p @all_posts.taggings
  # p "REFLECTIONS!!!  #{Post.reflections}"
  # @all_posts.each do |x|
  #   p x
    
  # end
  erb :posts
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  
  erb :post
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  @tags = Tag.includes(:posts).where(:posts => { id: params[:id] } ).all
  @tags = @tags.map { |e| e.tag }.join(", ")

  erb :edit_post
end

post '/posts/:id/edit' do
  # @post = Post.find(params[:id])
  # @post.update(title: params[:post_title], author: params[:post_author], body: params[:post_body])
  # @post.taggings.delete(tag: params[:post][:tags])
  # p params[:post][:tags]
  params[:post].each do |key, array|
    puts "#{key}-----"
    p array
  end
  redirect to ("/posts/#{params[:id]}")
end

post '/posts/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect to ("/posts")
end