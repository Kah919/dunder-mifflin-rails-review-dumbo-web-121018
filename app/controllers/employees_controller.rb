class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.valid?
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @dogs = Dog.all
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to employee_path(@employee)
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :office, :title, :img_url, :dog_id)
  end
end
