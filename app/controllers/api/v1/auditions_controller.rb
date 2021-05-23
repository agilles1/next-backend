class Api::V1::AuditionsController < ApplicationController
    before_action :set_audition, except: [:index, :create]

    def index 
        auditions = Audition.all
        render json: auditions
    end

    def create
        audition = Audition.new_with_rooms(audition_params)

        if audition.save 
            binding.pry
            render json: audition
        else
            render json: {error: 'Account not created'}
        end
    end

    def show
      render json: @audition
    end

    def destroy
        @account.destroy
    end

    private

    def audition_params
        params.require(:audition).permit(:date, :time, :instrument, :holding, :rooms)
    end

    def set_audition
        @audition = Audition.find(params[:id])
    end
end
