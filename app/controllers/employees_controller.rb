class EmployeesController < ApplicationController

    before_action :find_employee, only: [:show, :edit, :update, :destroy]

    def index
        @employees = Employee.all 
    end

    def show
        #find_employee
    end
    
    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        @employee.save
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end

    def destroy
        @employee.destroy
        redirect_to company_path(@employee.company.id)
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end
    
end
