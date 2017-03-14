enable :sessions

get '/signin' do
  erb :"static/signin"
end

get '/user/:id' do
  erb :"static/user"
end

get '/question' do
    # erb :new
    @questions = Question.all
    erb :"static/question"
end

get '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirthe appropriatepage
  session[:id] = nil
  redirect '/'
end

post '/signin' do
  user = User.find_by(email: params[:user][:email])
  if user && user.try(:authenticate, params[:user][:password])
    session[:id] ||= user.id
    #@session = session[:id]
    redirect "/user/#{user.id}"
  else
    redirect 'error'
  end
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    # what should happen if the user is saved?
    redirect '/user'
  else
    # what should happen if the user keyed in invalid date?
    redirect '/error'
  end
end

post '/question' do
    new_question = current_user.questions.new(question: params[:que])
    if new_question.save
      redirect '/question'
    else
      redirect '/error'
    end
end

post '/answer' do
    byebug
    new_answer = current_user.answers.new(answer: params[:ans])
    if new_answer.save
      redirect '/question'
    else
      redirect '/error'
    end
end
