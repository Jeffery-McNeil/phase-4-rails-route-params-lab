class StudentsController < ApplicationController

  def index
    students = if params[:name] == nil
                  Student.all
              else
                  Student.all.select{ |student| student.last_name.downcase == params[:name] || student.first_name.downcase == params[:name] }
              end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
