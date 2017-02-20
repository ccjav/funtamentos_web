helpers do
	def current_user
		session[:id]
	end

	def logged_in?
		true if current_user
	end
end