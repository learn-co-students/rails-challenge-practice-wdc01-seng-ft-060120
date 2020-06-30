class CompaniesController < ApplicationController
before_action :find_company, only: [:show, :edit, :update, :destroy]
    def index
        @companies = Company.all
    end

    def show
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        @company.save
        redirect_to company_path(@company)
    end

    def edit

    end

    def update 
        @company.update(company_params)
        redirect_to company_path(@company)
    end

    def destroy
        @customer.destroy
        redirect_to companies_path
    end

    private

    def company_params
        params.require(:company).permit(:name)
    end

    def find_company
        @company = Company.find(params[:id])
    end
end