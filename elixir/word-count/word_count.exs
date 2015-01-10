defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do  
	sentence
		|> String.replace("_"," ")
		|> String.replace(~r/[!&@$%^&:,]/,"")		
		|> String.split
		|> Enum.group_by(fn x -> String.downcase(x) end)
		|> Enum.into(%{}, fn {k,v} -> {k, length(v)} end)	
  end
  
end