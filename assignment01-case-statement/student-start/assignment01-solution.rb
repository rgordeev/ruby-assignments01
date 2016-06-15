some_var = "false"
another_var = "nil"

puts case some_var

when "pink elephant"
   "Don't think about the pink elephant!"

when false
   "Looks like this one should execute"

when another_var.nil?
   "Question mark in the method name?"

else
   "I guess nothing matched... But why?"
end