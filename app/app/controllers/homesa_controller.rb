class HomesaController < ApplicationController
  def index
  	@us= User.where(["id=?",current_user[:id].to_s])
  end
end
