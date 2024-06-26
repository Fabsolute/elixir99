defmodule WorkingWithListsTest do
  use Elixir99.TestCase
  doctest WorkingWithLists

  test "last" do
    assert WorkingWithLists.last([:a, :b, :c, :d]) == :d
    assert WorkingWithLists.last([:a]) == :a
    assert WorkingWithLists.last([]) == nil
  end

  test "last_but_one" do
    assert WorkingWithLists.last_but_one([:a, :b, :c, :d]) == :c
    assert WorkingWithLists.last_but_one([:a]) == nil
    assert WorkingWithLists.last_but_one([]) == nil
  end

  test "element_at" do
    assert WorkingWithLists.element_at([:a, :b, :c, :d], 2) == :c
    assert WorkingWithLists.element_at([], 0) == nil
    assert WorkingWithLists.element_at([:a, :b], -1) == nil
  end

  test "length" do
    assert WorkingWithLists.length([:a, :b, :c, :d, :e]) == 5
    assert WorkingWithLists.length([]) == 0
  end

  test "reverse" do
    assert WorkingWithLists.reverse([:a, :b, :c, :d, :e]) == [:e, :d, :c, :b, :a]
    assert WorkingWithLists.reverse([]) == []
  end

  test "is_palindrome?" do
    assert WorkingWithLists.is_palindrome?([:x, :a, :m, :a, :x]) == true
    assert WorkingWithLists.is_palindrome?([:a, :b, :c, :d, :a]) == false
  end

  test "flatten" do
    assert WorkingWithLists.flatten([:a, [:b, [:c, :d], :e]]) == [:a, :b, :c, :d, :e]
    assert WorkingWithLists.flatten([:a, :b, :c, :d, :e]) == [:a, :b, :c, :d, :e]
    assert WorkingWithLists.flatten([]) == []
  end

  test "compress" do
    assert WorkingWithLists.compress([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
             [:a, :b, :c, :a, :d, :e]

    assert WorkingWithLists.compress([:a, :a, :a, :a, :b]) == [:a, :b]
    assert WorkingWithLists.compress([:a]) == [:a]
    assert WorkingWithLists.compress([]) == []
  end

  test "pack" do
    assert WorkingWithLists.pack([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) == [
             [:a, :a, :a, :a],
             [:b],
             [:c, :c],
             [:a, :a],
             [:d],
             [:e, :e, :e, :e]
           ]

    assert WorkingWithLists.pack([:a, :a, :a, :a, :b]) == [[:a, :a, :a, :a], [:b]]
    assert WorkingWithLists.pack([:a]) == [[:a]]
    assert WorkingWithLists.pack([]) == []
  end

  test "encode" do
    assert WorkingWithLists.encode([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) == [
             {4, :a},
             {1, :b},
             {2, :c},
             {2, :a},
             {1, :d},
             {4, :e}
           ]

    assert WorkingWithLists.encode([:a, :a, :a, :a, :b]) == [{4, :a}, {1, :b}]
    assert WorkingWithLists.encode([:a]) == [{1, :a}]
    assert WorkingWithLists.encode([]) == []
  end

  test "encode_modified" do
    assert WorkingWithLists.encode_modified([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d]) == [
             {4, :a},
             :b,
             {2, :c},
             {2, :a},
             :d
           ]

    assert WorkingWithLists.encode_modified([:a, :a, :a, :a, :b]) == [{4, :a}, :b]
    assert WorkingWithLists.encode_modified([:a]) == [:a]
    assert WorkingWithLists.encode_modified([]) == []
  end

  test "decode" do
    assert WorkingWithLists.decode([{4, :a}, {1, :b}, {2, :c}, {2, :a}, {1, :d}, {4, :e}]) == [
             :a,
             :a,
             :a,
             :a,
             :b,
             :c,
             :c,
             :a,
             :a,
             :d,
             :e,
             :e,
             :e,
             :e
           ]

    assert WorkingWithLists.decode([{4, :a}, {1, :b}]) == [:a, :a, :a, :a, :b]
    assert WorkingWithLists.decode([{1, :a}]) == [:a]
    assert WorkingWithLists.decode([]) == []
  end

  test "encode_direct" do
    assert WorkingWithLists.encode_direct([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d]) == [
             {4, :a},
             :b,
             {2, :c},
             {2, :a},
             :d
           ]

    assert WorkingWithLists.encode_direct([:a, :a, :a, :a, :b]) == [{4, :a}, :b]
    assert WorkingWithLists.encode_direct([:a]) == [:a]
    assert WorkingWithLists.encode_direct([]) == []
  end

  test "duplicate" do
    assert WorkingWithLists.duplicate([:a, :b, :b, :c]) == [:a, :a, :b, :b, :b, :b, :c, :c]
    assert WorkingWithLists.duplicate([:a]) == [:a, :a]
    assert WorkingWithLists.duplicate([]) == []
  end

  test "duplicate\\2" do
    assert WorkingWithLists.duplicate([:a, :b, :b, :c]) == [:a, :a, :b, :b, :b, :b, :c, :c]
    assert WorkingWithLists.duplicate([:a]) == [:a, :a]
    assert WorkingWithLists.duplicate([]) == []
  end

  test "drop" do
    assert WorkingWithLists.drop([:a, :b, :c, :d, :e, :f, :g, :h, :i, :k], 3) == [
             :a,
             :b,
             :d,
             :e,
             :g,
             :h,
             :k
           ]

    assert WorkingWithLists.drop([:a, :b, :c], 1) == []
    assert WorkingWithLists.drop([:a], 2) == [:a]
    assert WorkingWithLists.drop([], 2) == []
  end

  test "split" do
    assert WorkingWithLists.split([:a, :b, :c, :d, :e, :f, :g, :h, :i, :k], 3) ==
             {[:a, :b, :c], [:d, :e, :f, :g, :h, :i, :k]}

    assert WorkingWithLists.split([:a, :b, :c], 1) == {[:a], [:b, :c]}
    assert WorkingWithLists.split([:a], 1) == {[:a], []}
    assert WorkingWithLists.split([:a], 2) == {[:a], []}
    assert WorkingWithLists.split([:a], 0) == {[], [:a]}
    assert WorkingWithLists.split([], 0) == {[], []}
  end

  test "slice" do
    assert WorkingWithLists.slice([:a, :b, :c, :d, :e, :f, :g, :h, :i, :k], 2, 6) == [
             :c,
             :d,
             :e,
             :f,
             :g
           ]

    assert WorkingWithLists.slice([:a, :b, :c, :d, :e], 0, 10) == [:a, :b, :c, :d, :e]
    assert WorkingWithLists.slice([], 5, 10) == []
  end

  test "rotate" do
    assert WorkingWithLists.rotate([:a, :b, :c, :d, :e, :f, :g, :h], 3) == [
             :d,
             :e,
             :f,
             :g,
             :h,
             :a,
             :b,
             :c
           ]

    assert WorkingWithLists.rotate([:a, :b, :c, :d, :e, :f, :g, :h], -2) == [
             :g,
             :h,
             :a,
             :b,
             :c,
             :d,
             :e,
             :f
           ]

    assert WorkingWithLists.rotate([:a, :b], 1) == [:b, :a]
    assert WorkingWithLists.rotate([:a, :b], 0) == [:a, :b]
    assert WorkingWithLists.rotate([:a], 1) == [:a]
    assert WorkingWithLists.rotate([], 1) == []
  end

  test "remove_at" do
    assert WorkingWithLists.remove_at([:a, :b, :c, :d], 1) = {:b, [:a, :c, :d]}
    assert WorkingWithLists.remove_at([:a, :b, :c, :d], 5) = {nil, [:a, :b, :c, :d]}
    assert WorkingWithLists.remove_at([], 1) = {nil, []}
  end

  test "insert_at" do
    assert WorkingWithLists.insert_at(:alfa, [:a, :b, :c, :d], 1) == [:a, :alfa, :b, :c, :d]
    assert WorkingWithLists.insert_at(:beta, [], 2) == [:beta]
  end

  test "range" do
    assert WorkingWithLists.range(4, 9) == [4, 5, 6, 7, 8, 9]
    assert WorkingWithLists.range(-1, 2) == [-1, 0, 1, 2]
    assert WorkingWithLists.range(-4, -1) == [-4, -3, -2, -1]
    assert WorkingWithLists.range(-4, -4) == [-4]
    assert WorkingWithLists.range(-4, -5) == [-4]
  end

  test "random_select" do
    assert WorkingWithLists.random_select([:a, :b, :c, :d], 3), fn result ->
      (result |> Enum.sort()) in [
        [:a, :b, :c],
        [:a, :b, :d],
        [:a, :c, :d],
        [:b, :c, :d]
      ]
    end
  end

  test "random_select when integer" do
    assert WorkingWithLists.random_select(3, 4), fn result ->
      (result |> Enum.sort()) in [
        [1, 2, 3],
        [1, 2, 4],
        [1, 3, 4],
        [2, 3, 4]
      ]
    end
  end

  test "random_permutate" do
    assert WorkingWithLists.random_permutate([:a, :b, :c]), fn result ->
      result in [
        [:a, :b, :c],
        [:b, :a, :c],
        [:c, :a, :b],
        [:a, :c, :b],
        [:b, :c, :a],
        [:c, :b, :a]
      ]
    end

    assert WorkingWithLists.random_permutate([:a, :b]), fn result ->
      result in [[:a, :b], [:b, :a]]
    end

    assert WorkingWithLists.random_permutate([:A, :B, :C, :D]), fn result ->
      result in [
        [:A, :B, :C, :D],
        [:B, :A, :C, :D],
        [:C, :A, :B, :D],
        [:A, :C, :B, :D],
        [:B, :C, :A, :D],
        [:C, :B, :A, :D],
        [:C, :B, :D, :A],
        [:B, :C, :D, :A],
        [:D, :C, :B, :A],
        [:C, :D, :B, :A],
        [:B, :D, :C, :A],
        [:D, :B, :C, :A],
        [:D, :A, :C, :B],
        [:A, :D, :C, :B],
        [:C, :D, :A, :B],
        [:D, :C, :A, :B],
        [:A, :C, :D, :B],
        [:C, :A, :D, :B],
        [:B, :A, :D, :C],
        [:A, :B, :D, :C],
        [:D, :B, :A, :C],
        [:B, :D, :A, :C],
        [:A, :D, :B, :C],
        [:D, :A, :B, :C]
      ]
    end
  end

  test "combination" do
    assert WorkingWithLists.combination(3, [:a, :b, :c, :d]) == [
             [:a, :b, :c],
             [:a, :b, :d],
             [:a, :c, :d],
             [:b, :c, :d]
           ]

    assert WorkingWithLists.combination(2, [:a, :b, :c, :d]) == [
             [:a, :b],
             [:a, :c],
             [:a, :d],
             [:b, :c],
             [:b, :d],
             [:c, :d]
           ]
  end

  test "group/1" do
    assert WorkingWithLists.group([:aldo, :beat, :carla, :david, :evi, :flip, :gary, :hugo, :ida]) ==
             WorkingWithListsTest.Data.Group1.result()
  end

  test "group/2" do
    assert WorkingWithLists.group(
             [:aldo, :beat, :carla, :david, :evi, :flip, :gary, :hugo, :ida],
             [3, 3, 3]
           ) == WorkingWithListsTest.Data.Group2.result1()

    assert WorkingWithLists.group([:aldo, :beat, :carla, :david, :evi, :flip], [1, 1, 2, 2]) ==
             WorkingWithListsTest.Data.Group2.result2()
  end

  test "lsort" do
    assert WorkingWithLists.lsort([
             [:a, :b, :c],
             [:d, :e],
             [:f, :g, :h],
             [:d, :e],
             [:i, :j, :k, :l],
             [:m, :n],
             [:o]
           ]) == [
             [:o],
             [:d, :e],
             [:d, :e],
             [:m, :n],
             [:a, :b, :c],
             [:f, :g, :h],
             [:i, :j, :k, :l]
           ]
  end

  test "lfsort" do
    assert WorkingWithLists.lfsort([
             [:a, :b, :c],
             [:d, :e],
             [:f, :g, :h],
             [:d, :e],
             [:i, :j, :k, :l],
             [:m, :n],
             [:o]
           ]) == [
             [:i, :j, :k, :l],
             [:o],
             [:a, :b, :c],
             [:f, :g, :h],
             [:d, :e],
             [:d, :e],
             [:m, :n]
           ]
  end
end
