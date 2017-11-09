class TodosController < ApplicationController
  before_action :set_todo, :only=>[:show,:edit,:update,:destroy]
  def index
    @todos=Todo.all
  end
  def new
    @todo=Todo.new
  end

  def create
    @todo=Todo.new(todo_params)
    if @todo.save
      render :action =>:show
    else
      render :action=>:new
    end
  end

  #def show
  #  @todo=Todo.find(params[:id])
  #end

  #def edit
    #@todo=Todo.find(params[:id])
  #end

  def update
    #@todo=Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      render :action =>:show
      #redirect_to todos_url
    else
      render :action =>:edit
    end
  end
  def destroy
    #@todo=Todo.find(params[:id])
    @todo.destroy

    redirect_to todos_url
  end

  private
  def todo_params
    params.require(:todo).permit(:name,:date,:note)
  end
  def set_todo
    @todo = Todo.find(params[:id])
  end





end
