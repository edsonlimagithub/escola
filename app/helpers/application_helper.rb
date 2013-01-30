module ApplicationHelper
  def ufList
    ufs = ["AL","AM","AP","BA","CE","DF","ES","GO","MA","MG","MS","MT","PA","PB",
           "PE","PI","PR","RJ","RN","RO","RR","RS","SC","SE","SP","TO"]
  end
  
  def date_br_format date_in
    date_out = date_in.strftime("%dd/%mm/%YY")
    date_out
  end
  
  def valor_br valor
    valor =  number_to_currency(valor, :separator => ',', :precision => 2)
  end
  
end
