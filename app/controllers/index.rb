get '/' do

  posts = Post.all
  comments = Comment.all
  @post_comment_count = []
  posts.each do |post|
    all = {}
    all[:post] = post.post_title
    all[:comment_count] = post.comments.where(post_id: post.id).count
    all[:source] = post.source
    all[:id] = post.id
    @post_comment_count << all
  end

  erb :index
end

get '/login' do

  erb :login
end

post '/login' do
  @email = params[:user][:email]
  # @user = User.find_by_email(params[:email])
  user = User.authenticate(@email, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect "/profile/#{user.id}"
  else
    redirect '/login'
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])

  erb :post
end

get '/profile/:id' do
  @user = User.find(params[:id])

erb :profile
end

get '/newpost' do

  erb :new_post
end

post '/newpost' do
  p user = User.find(session[:user_id])
  p params[:post]
  user.posts << Post.create(params[:post])
  redirect "/profile/#{user.id}"
end
