defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
	count_p(l, 0)
  end
  
  defp count_p([], count) do
	count
  end  
  defp count_p([h|t], count) do	
	count_p(t, count + 1)
  end

  @spec reverse(list) :: list
  def reverse(l) do
	reverse_p(l, [])
  end
  
  defp reverse_p([], new_list) do
	new_list
  end
  defp reverse_p([h|t], new_list) do
	reverse_p(t, [h | new_list])
  end
  

  @spec map(list, (any -> any)) :: list
  def map(l, f) do		
	map_p(reverse(l), f, [])
  end

  defp map_p([], f, new_list) do
	new_list
  end
  defp map_p([h|t], f, new_list) do
	map_p(t, f, [f.(h) | new_list])
  end
  
  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter_p(reverse(l), f, [])
  end
  
  defp filter_p([], f, new_list) do
	new_list
  end
  defp filter_p([h|t], f, new_list) do
	cond do
	  f.(h) -> 
	    filter_p(t, f, [h | new_list])
	  true ->
	    filter_p(t, f, new_list)
	end    
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
	reduce_p(l, acc, f)
  end

  defp reduce_p([], acc, f) do
	acc
  end
  defp reduce_p([h|t], acc, f) do
	reduce_p(t, f.(h, acc), f )
  end
  
  @spec append(list, list) :: list
  def append(a, b) do
	a_rev = reverse(a)
  
	case {a, b} do
	  {[], []} -> []
	  {[], _} -> b	  
	  _ -> append_p(a_rev, b)
	end
  end
  
  defp append_p(a, []) do
	reverse(a)
  end  
  defp append_p(a, [h|t]) do
	append_p([h | a], t)  
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do	
	concat_p(ll, [])
  end
  
  defp concat_p([], main_list) do
	main_list
  end  
  defp concat_p([h|t], main_list) do	
    do_concat(t, reverse(h))
  end
  
  defp do_concat([], main_list) do
	reverse(main_list)
  end
  defp do_concat([h|t], main_list) do
	new_list = concat_append(main_list, h)
    do_concat(t, new_list)
  end
  defp concat_append(a, []) do
	a
  end  
  defp concat_append(a, [h|t]) do
	concat_append([h | a], t)  
  end
  
end
