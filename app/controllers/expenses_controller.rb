class ExpensesController < ApplicationController
	before_action :authenticate_user!

	def index
	
	concept = params[:concept]
  	category_id = params[:category_id]
  	if !concept.blank? && !category_id.blank?
    	@expenses = Expense.where("concept like '%#{concept}%' and category_id = #{category_id}").order("date DESC")
  	elsif concept.blank? && !category_id.blank?
  		@expenses = Expense.where("category_id = #{category_id}").order("date DESC")
  	elsif !concept.blank? && category_id.blank?
  	  @expenses = Expense.where("concept like '%#{concept}%'").order("date DESC")
  	else
  		@expenses = Expense.order("date DESC").where(user_id: current_user.id)
  	end
  end
end
