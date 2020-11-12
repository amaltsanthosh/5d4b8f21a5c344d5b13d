# frozen_string_literal: true

module Api
  # User controller
  class UserController < ApplicationController
    before_action :find_user, only: %(show update destroy)

    def index
      @users = User.all
      render json: @users, status: :ok
    end

    def show
      @user = User.find(params[:id].to_i)
      render json: @user, status: :ok
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages, status: :unprocessable_entity }
      end
    end

    def update
      @user = User.find(params[:id].to_i)
      if @user.present?
        @user.update(user_params)
        render json: { message: 'success', data: @user }
      else
        render json: { errors: 'User not found' }, status: :not_found
      end
    end

    def destroy
      @user = User.find(params[:id].to_i)
      if @user.present?
        @user.destroy(user_params)
        render json: { message: 'success', data: @user }
      else
        render json: { errors: 'User not found' }, status: :not_found
      end
    end

    private

    def find_user
      @user = User.find(params[:id].to_i)
    end

    def user_params
      params.permit(:id, :email, :firstName, :lastName)
    end
  end
end
