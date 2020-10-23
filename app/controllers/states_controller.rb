class StatesController < ApplicationController
    before_action :authorized

    def index 
        @states = State.all
    end 
end
