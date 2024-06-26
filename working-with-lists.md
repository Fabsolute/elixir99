# Working with lists

## #01 - Find the last element of a list

### ★

Example:
```elixir
iex> WorkingWithLists.last([:a, :b, :c, :d])
:d
```

## #02 - Find the last but one element of a list

### ★

Example:
```elixir
iex> WorkingWithLists.last_but_one([:a, :b, :c, :d])
:c

```

## #03 - Find the K'th element of a list

### ★

The first element in the list is number 1.

Example:
```elixir
iex> WorkingWithLists.element_at([:a, :b, :c, :d, e], 2)
:c
```

## #04 - Find the number of elements of a list

### ★

Example:
```elixir
iex> WorkingWithLists.length([:a, :b, :c, :d, :e])
5
```

## #05 - Reverse a list

### ★

Example:
```elixir
iex> WorkingWithLists.reverse([:a, :b, :c, :d, :e])
[:e, :d, :c, :b, :a]
```

## #06 - Find out whether a list is a palindrome

### ★

A palindrome can be read forward or backward.

Example:
```elixir
iex> WorkingWithLists.is_palindrome?([:x, :a, :m, :a, :x])
true
```

## #07 - Flatten a nested list structure

### ★★

Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

Example:
```elixir
iex> WorkingWithLists.flatten([:a, [:b, [:c, :d], :e]])
[:a, :b, :c, :d, :e]
```

## #08 - Eliminate consecutive duplicates of list elements

### ★★

If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

Example:
```elixir
iex> WorkingWithLists.compress([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
[:a, :b, :c, :a, :d, :e]
```

## #09 - Pack consecutive duplicates of list elements into sublists

### ★★

If a list contains repeated elements they should be placed in separate sublists.

Example:
```elixir
iex> WorkingWithLists.pack([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
[[:a, :a, :a, :a], [:b], [:c, :c], [:a, :a], [:d], [:e, :e, :e, :e]]
```

## #10 - Run-length encoding of a list

### ★

Use the result of problem [#09](#09---pack-consecutive-duplicates-of-list-elements-into-sublists) to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms {N,E} where N is the number of duplicates of the element E.

Example:
```elixir
iex> WorkingWithLists.encode([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
[{4, :a}, {1, :b}, {2, :c}, {2, :a}, {1, :d}, {4, :e}]
```

## #11 - Modified run-length encoding

### ★

Modify the result of problem [#10](#10---run-length-encoding-of-a-list) in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as {N,E} terms.

Example:
```elixir
iex> WorkingWithLists.encode_modified([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
[{4, :a}, :b, {2, :c}, {2, :a}, :d, {4, :e}]
```

## #12 - Decode a run-length encoded list

### ★★

Given a run-length code list generated as specified in problem [#11](#11---modified-run-length-encoding). Construct its uncompressed version.

Example:
```elixir
iex> WorkingWithLists.decode([{4, :a}, {1, :b}, {2, :c}, {2, :a}, {1, :d}, {4, :e}])
[:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]
```

## #13 - Run-length encoding of a list (direct solution)

### ★★

Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem [#09](#09---pack-consecutive-duplicates-of-list-elements-into-sublists), but only count them. As in problem [#11](#11---modified-run-length-encoding), simplify the result list by replacing the singleton terms {1,X} by X.

Example:
```elixir
iex> WorkingWithLists.encode_direct([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
[{4, :a}, :b, {2, :c}, {2, :a}, :d, {4, :e}]
```

## #14 - Duplicate the elements of a list

### ★

Example:
```elixir
iex> WorkingWithLists.duplicate([:a, :b, :c, :c, :d])
[:a, :a, :b, :b, :c, :c, :c, :c, :d, :d]
```

## #15 - Duplicate the elements of a list a given number of times

### ★★

Example:
```elixir
iex> WorkingWithLists.duplicate([:a, :b, :c], 3)
[:a, :a, :a, :b, :b, :b, :c, :c, :c]
```

## #16 - Drop every N'th element from a list

### ★★

Example:
```elixir
iex> WorkingWithLists.drop([:a, :b, :c, :d, :e, :f, :g, :h, :i, :k], 3)
[:a, :b, :d, :e, :g, :h, :k]
```

## #17 - Split a list into two parts; the length of the first part is given

### ★

Do not use any predefined predicates

Example:
```elixir
iex> WorkingWithLists.split([:a, :b, :c, :d, :e, :f, :g, :h, :i, :k], 3)
{[:a, :b, :c], [:d, :e, :f, :g, :h, :i, :k]}
```

## #18 - Extract a slice from a list

### ★★

Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 0.

Example:
```elixir
iex> WorkingWithLists.slice([:a, :b, :c, :d, :e, :f, :g, :h, :i, :k], 2, 6)
[:c, :d, :e, :f, :g]
```

## #19 - Rotate a list N places to the left

### ★★

Examples:
```elixir
iex> WorkingWithLists.rotate([:a, :b, :c, :d, :e, :f, :g, :h], 3)
[:d, :e, :f, :g, :h, :a, :b, :c]

iex> WorkingWithLists.rotate([:a, :b, :c, :d, :e, :f, :g, :h], -2)
[:g, :h, :a, :b, :c, :d, :e, :f]
```

## #20 - Remove the K'th element from a list

### ★

Example:
```elixir
iex> WorkingWithLists.remove_at([:a, :b, :c, :d], 1)
{:b, [:a, :c, :d]}
```

## #21 - Insert an element at a given position into a list

### ★

Example:
```elixir
iex> WorkingWithLists.insert_at(:alfa, [:a, :b, :c, :d], 1)
[:a, :alfa, :b, :c, :d]
```

## #22 - Create a list containing all integers within a given range

### ★

Example:
```elixir
iex> WorkingWithLists.range(4, 9)
[4, 5, 6, 7, 8, 9]
```

## #23 - Extract a given number of randomly selected elements from a list

### ★★

The selected items shall be put into a result list

Example:
```elixir
iex> WorkingWithLists.random_select([:a, :b, :c, :d, :e, :f, :g, :h], 3)
[:e, :d, :a]
```

## #24 - Lotto: Draw N different random numbers from the set 1..M

### ★

The selected numbers shall be put into a result list

Example:
```elixir
iex> WorkingWithLists.random_select(6, 49)
[23, 1, 17, 33, 21, 37]
```

## #25 - Generate a random permutation of the elements of a list

### ★

Example:
```elixir
iex> WorkingWithLists.random_permutate([:a, :b, :c, :d, :e, :f])
[:b, :a, :d, :c, :e, :f]
```

## #26 - Generate the combinations of K distinct objects chosen from the N elements of a list

### ★★

In how many ways can a committee of 3 be chosen from a group of 12 people? We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the well-known binomial coefficients). For pure mathematicians, this result may be great. But we want to really generate all the possibilities (via backtracking).

Example:
```elixir
iex> WorkingWithLists.combination(3, [:a, :b, :c, :d])
[[:a, :b, :c], [:a, :b, :d], [:a, :c, :d], [:b, :c, :d]] 
```

## #27 - Group the elements of a set into disjoint subsets

### ★★

a) In how many ways can a group of 9 people work in 3 disjoint subgroups of 2, 3 and 4 persons? Write a predicate that generates all the possibilities via backtracking.

Example:
```elixir
iex> WorkingWithLists.group([:aldo, :beat, :carla, :david, :evi, :flip, :gary, :hugo, :ida])
[[[:aldo, :beat], [:carla, :david, :evi], [:flip, :gary, :hugo, :ida]], ...] 
```

b) Generalize the above predicate in a way that we can specify a list of group sizes and the predicate will return a list of groups.

Example:
```elixir
iex> WorkingWithLists.group([:aldo, :beat, :carla, :david, :evi, :flip, :gary, :hugo, :ida], [2, 2, 5])
[[[:aldo, :beat], [:carla, :david, :evi], [:flip, :gary, :hugo, :ida]], ...] 
```

## #28 - Sorting a list of lists according to length of sublists

### ★★

a) We suppose that a list (InList) contains elements that are lists themselves. The objective is to sort the elements of InList according to their **length**. E.g. short lists first, longer lists later, or vice versa.

Example:
```elixir
iex> WorkingWithLists.lsort([[:a, :b, :c], [:d, :e], [:f, :g, :h], [:d, :e], [:i, :j, :k, :l], [:m, :n], [:o]])
[[:o], [:d, :e], [:d, :e], [:m, :n], [:a, :b, :c], [:f, :g, :h], [:i, :j, :k, :l]] 
```

b) Again, we suppose that a list (InList) contains elements that are lists themselves. But this time the objective is to sort the elements of InList according to their **length frequency**; i.e. in the default, where sorting is done ascendingly, lists with rare lengths are placed first, others with a more frequent length come later.

Example:
```elixir
iex> WorkingWithLists.lfsort([[:a, :b, :c], [:d, :e], [:f, :g, :h], [:d, :e], [:i, :j, :k, :l], [:m, :n], [:o]])
[[:i, :j, :k, :l], [:o], [:a, :b, :c], [:f, :g, :h], [:d, :e], [:d, :e], [:m, :n]] 
```
