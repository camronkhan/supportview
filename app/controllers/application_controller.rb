class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	# Controller filter --> Restricts all pages/actions
	before_action :authenticate_user!
end
