defmodule WorkingWithLists do
  import Kernel, except: [length: 1]

  def last([]), do: nil
  def last([element]), do: element
  def last([_ | rest]), do: last(rest)

  def last_but_one([]), do: nil
  def last_but_one([element, _other]), do: element
  def last_but_one([_ | rest]), do: last_but_one(rest)

  def element_at([], _), do: nil
  def element_at([element | _rest], 0), do: element
  def element_at([_ | rest], n), do: element_at(rest, n - 1)

  def length(elements), do: length(elements, 0)
  defp length([], n), do: n
  defp length([_ | rest], n), do: length(rest, n + 1)

  def reverse(elements), do: reverse(elements, [])
  defp reverse([], acc), do: acc
  defp reverse([element | rest], acc), do: reverse(rest, [element | acc])

  def is_palindrome?(elements) do
    {l1, l2} = Enum.split(elements, length(elements) |> div(2))

    l2 =
      if l1 == l2 do
        l2
      else
        tl(l2)
      end

    l1 == Enum.reverse(l2)
  end

  def flatten(elements), do: flatten(elements, [])
  defp flatten([], acc), do: acc
  defp flatten([head | tail], acc) when is_list(head), do: flatten(tail, flatten(head, acc))
  defp flatten([head | tail], acc), do: flatten(tail, acc ++ [head])

  def compress(elements), do: compress(elements, nil, [])
  defp compress([], _current, acc), do: acc
  defp compress([h | tail], current, acc) when h == current, do: compress(tail, current, acc)
  defp compress([h | tail], _current, acc), do: compress(tail, h, acc ++ [h])

  def pack([]), do: []
  def pack([h | elements]), do: pack(elements, [[h]])
  defp pack([], acc), do: reverse(acc)

  defp pack([h | tail], [[current | last] | acc]) when h == current do
    pack(tail, [[h, current | last] | acc])
  end

  defp pack([h | tail], [last | acc]), do: pack(tail, [[h], last | acc])

  def encode(list) do
    list
    |> pack()
    |> Enum.map(fn list = [c | _] -> {length(list), c} end)
  end

  def encode_modified(list) do
    list
    |> encode()
    |> Enum.map(fn
      {1, c} -> c
      other -> other
    end)
  end

  def decode(elements) do
    elements
    |> Enum.flat_map(fn {count, char} -> List.duplicate(char, count) end)
  end

  def encode_direct(list) do
    :not_implemented
  end

  def duplicate(list) do
    :not_implemented
  end

  def duplicate(list, amount) do
    :not_implemented
  end

  def drop(list, amount) do
    :not_implemented
  end

  def split(list, amount) do
    :not_implemented
  end

  def slice(list, from, to) do
    :not_implemented
  end

  def rotate(list, amount) do
    :not_implemented
  end

  def remove_at(list, index) do
    :not_implemented
  end

  def insert_at(element, list, index) do
    :not_implemented
  end

  def range(from, to) do
    :not_implemented
  end

  def random_select(list, amount) do
    :not_implemented
  end

  def random_select(amount, to) do
    :not_implemented
  end

  def random_permutate(list) do
    :not_implemented
  end

  def combination(amount, list) do
    :not_implemented
  end

  def group(list) do
    :not_implemented
  end

  def group(list, group_amounts) do
    :not_implemented
  end

  def lsort(list) do
    :not_implemented
  end

  def lfsort(list) do
    :not_implemented
  end
end
