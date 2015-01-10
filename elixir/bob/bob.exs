defmodule Teenager do
  def hey(input) do
    strippedInput = input |> String.strip

    cond do
        strippedInput == "" ->
            "Fine. Be that way!"
        String.ends_with?(strippedInput, "?") ->
            "Sure."        
        strippedInput == String.upcase(strippedInput) and strippedInput != String.downcase(strippedInput) ->
            "Whoa, chill out!"                  
        true ->            
            "Whatever."
    end
  end
end