CS.states(:us).each do |key, value|
    State.create(name:"#{key} - #{value}")  
end 
