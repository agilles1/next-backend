class Api::V1::AuditionsController < ApplicationController
    before_action :set_audition

    def show
      render json: @audition
    end

    private

    def audition_params
        params.require(:audition).permit(:date, :instrument)
    end

    def set_audition
        @audition = Audition.find(params[:id])
    end
end
