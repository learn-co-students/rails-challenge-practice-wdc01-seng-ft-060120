class EmployeesController < ApplicationController

    def show
        find_employee
    end
    
    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        @employee.save

        redirect_to employee_path(@employee)
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end
end
