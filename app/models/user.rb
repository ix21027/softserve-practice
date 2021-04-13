class User < ApplicationRecord
  
  def self.sorted(params)
    case params[:sort_by]
    when "lname_asc"
      order(:lname)
    when "lname_desc"
      order(lname: :desc)
    when "ysalary_asc"
      order(:ysalary)
    when "ysalary_desc"
      order(ysalary: :desc)
    else
      order id: :desc
    end
  end
end
