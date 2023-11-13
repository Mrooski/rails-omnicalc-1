Rails.application.routes.draw do
  get("/", {:controller => "math", :action => "square"})
  get("/square/new", {:controller => "math", :action => "square"})
  get("/square/results", {:controller => "math", :action => "square"})
  get("/square_root/new", {:controller => "math", :action => "square_root"})
  get("/square_root/results", {:controller => "math", :action => "square_root"})
  ["new", "results"].each do |name|
    get("/payment/#{name}", {:controller => "math", :action => "payment"})
  end
  ["new", "results"].each do |name|
    get("/random/#{name}", {:controller => "math", :action => "random"})
  end
end
