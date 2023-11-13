class MathController < ApplicationController
  def square
    if params[:number] != nil
      @number = params.fetch("number").to_f
      @output = @number ** 2
    end
    render({:template => "math_templates/square"})
  end

  def square_root
    if params[:number] != nil
      @number = params.fetch("number").to_f
      @output = @number ** 0.5
    end
    render({:template => "math_templates/square_root"})
  end

  def payment
    if params[:user_apr] != nil
      @apr = params.fetch("user_apr").to_f
      @years = params.fetch("user_years").to_f
      @principal = params.fetch("user_pv").to_f
    
      months = @years * 12
      monthly_rate = @apr / 100 / 12
    
      @numerator = monthly_rate * @principal
      @denominator = 1 - (1 + monthly_rate) ** (-months)
    
      @payment = @numerator / @denominator
      @payment = @payment.to_fs(:currency)
      @apr = @apr.to_fs(:percentage, { :precision => 4})
      @principal = @principal.to_fs(:currency)
      
    end
    render({:template => "math_templates/payment"})
  end

  def random
    if params[:user_min] != nil
      @max = params.fetch("user_max").to_f
      @min = params.fetch("user_min").to_f
    
      @result = rand(@min..@max)
      # @result = "dan"
    end
    render({:template => "math_templates/random"})
  end
  
end
