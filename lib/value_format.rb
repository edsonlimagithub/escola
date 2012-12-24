module ValueFormat
  
  def parsePriceToFloat value
    value["R$ "] = ""
    while value["."]
      value["."] = ""
    end
    value[","] = "." 
    value
  end
  
end