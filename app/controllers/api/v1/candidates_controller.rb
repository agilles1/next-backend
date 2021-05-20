class Api::V1::CandidatesController < ApplicationController
    before_action :set_candidate, except: [:index, :create]

    def index
        candidates = Candidate.all
        render json: candidates
    end

    def show
        render json: @candidate
    end

    def create
        candidate = Candidate.new(candidate_params)
        candidate.assign_number
        candidate.assign_room

        if candidate.save
            render json: candidate
        else
            render json: {error: 'Candidate not created'}
        end
    end

    def update
        @candidate.update_room
        if @candidate.save
            render json: @candidate
        else
            render json: {error: 'Error updating room}
        end
    end

    def destroy
        @candidate.destroy
    end

    private

    def candidate_params
        params.require(:candidate).permit(:name, :email, :phone, :audition_id)
    end

    def set_candidate
        @candidate = Candidate.find(params[:id])
    end

end
