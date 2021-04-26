class User < ApplicationRecord
  validates :lname, :fname, :ysalary, presence: true
  validates :lname, :fname, uniqueness: true
  
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
