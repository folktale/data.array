# # Common array operations
#
# Note that this library *intentionally* does not deal with sparse arrays.

/** ^
 * Copyright (c) 2013 Quildreen Motta
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

Maybe = require 'monads.maybe'


# ## Function: find
#
# Given a predicate, returns the first element to match.
#
# + type: (a -> Boolean) -> [a] -> Maybe a
export find = (p, xs) --> do
                          for x in xs => if p x => Maybe.of x
                          else                  => Maybe.Nothing!


# ## Function: find-index
#
# Given a predicate, returns the index of the first element to match.
#
# + type: (a -> Boolean) -> [a] -> Maybe Int
export find-index = (p, xs) --> do
                                for x,i in xs => if p x => Maybe.of i
                                else                    => Maybe.Nothing!


# ## Function: find-indices
#
# Given a predicate, returns the indices of all elements that match.
#
# + type: (a -> Boolean) -> [a] -> [Int]
export find-indices = (p, xs) --> [i for x,i in xs when p x]
                                 

# ## Function: unique-by
# 
# Removes duplicate elements from a list, given a comparison function.
#  
# + type: (a -> a -> Boolean) -> [a] -> [a]
export unique-by = (p, xs) --> ...


# ## Function: without
#
# Returns a new list without the first element to match the predicate.
#
# + type: (a -> Boolean) -> [a] -> [a]
export without = (p, xs) --> ...


# ## Function: union-by
#
# Returns the union of both lists, all duplicate elements removed.
#
# + type: (a -> a -> Boolean) -> [a] -> [a] -> [a]
export union-by = (p, xs, ys) --> ...


# ## Function: intersect-by
#
# Returns the intersection of both lists.
#
# + type: (a -> a -> Boolean) -> [a] -> [a] -> [a]
export intersect-by = (p, xs, ys) --> ...


# ## Function: intersperse
#
# Intersperses an element between elements of the list.
#
# + type: a -> [a] -> [a]
export intersperse = (x, xs) --> ...


# ## Function: transpose
#
# Transposes the rows and columns of the list.
#
# + type: [[a]] -> [[a]]
export transpose = (xss) -> ...


# ## Function: partition
#
# Partitions the list between the elements that pass the predicate, and
# the ones that don't.
#
# + type: (a -> Boolean) -> [a] -> ([a], [a])
export partition = (p, xs) --> ...


# ## Function: group-by
#
# Returns an alist of items according to the classifier function.
#
# + type: (a -> b) -> [a] -> [(b, [a])]
export group-by = (f, xs) --> ...


# ## Function: sort-by
#
# Sorts the list according to a sorgint function.
#
# + type: (a -> a -> Ordering) -> [a] -> [a]
export sort-by = (f, xs) --> ...


# ## Function: maximum-by
#
# Returns the maximum element according to a classifier.
#  
# + type: (a -> a -> Ordering) -> [a] -> a
export maximum-by = (f, xs) --> ...


# ## Function: minimum-by
#
# Returns the minimum element according to a classifier.
#
# + type: (a -> a -> Ordering) -> [a] -> a
export minimum-by = (f, xs) --> ...


# ## Function: zip-with
#
# Zips two lists together. If they're of different length, throws an
# exception.
#
# + type: (*throws) => (a -> b -> c) -> [a] -> [b] -> [c]
export zip-with = (f, xs, ys) --> ...


# ## Function: zip-with3
#
# Zips three lists together. If they're of different length, throws an
# exception.
#
# + type: (*throws) => (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
export zip-with3 = (f, xs, ys, zs) --> ...


# ## Function: zip-withN
#
# Zips N lists together. If they're of different length, throws an
# exception.
#
# + type: (*throws) => (a1, a2, ..., aN -> b) -> [[a1], [a2], ..., [aN]] -> [b]
export zip-withN = (f, xss) --> ...


# ## Function: unzip
#
# Takes a list of tuples, returns a tuple of lists
#
# + type: [(a1, a2, ..., aN)] -> ([a1], [a2], ..., [aN])
export unzip = (xs) -> ...


# ## Function: unfold-right
#
# Builds a list from a seed value.
#
# + type: (b -> Maybe((a, b))) -> b -> [a]
export unfold = (f, b) --> ...


# ## Function: map
#
# Maps over a list.
#
# + type: (a -> b) -> [a] -> [b]
export map = (f, xs) --> ...


# ## Function: concat
#
# Concats two lists. Throws an error if one of the elements isn't a
# list.
#  
# + type: [a] -> [a] -> [a]
export concat = (xs, ys) --> ...


# ## Function: filter
#
# Filters a list by a predicate.
#
# + type: (a -> Bool) -> [a] -> [a]
export filter = (p, xs) --> ...


# ## Function: head
#
# Maybe returns the first item of the list.
#
# + type: [a] -> Maybe a
export head = (xs) -> ...


# ## Function: last
#
# Maybe returns the last item of the list.
#
# + type: [a] -> Maybe a
export tail = (xs) -> ...


# ## Function: init
#
# Returns all items but the last.
#
# + type: [a] -> [a]
export init = (xs) -> ...


# ## Function: tail
#
# Returns all items of the list but the first.
#
# + type: [a] -> [a]
export tail = (xs) -> ...


# ## Function: is-empty
#
# Tests if the list contains no values.
#
# + type: [a] -> Boolean
export is-empty = (xs) -> ...


# ## Function: at
#
# Maybe returns the element at the given index.
#
# + type: Int -> [a] -> Maybe a
export at = (n, xs) --> ...


# ## Function: fold-right
#
# Right-associative folding.
#
# + type: (a, b -> b) -> b -> [a] -> b
export fold-right = (f, b, xs) --> ...


# ## Function: fold-left
#
# Left-associative fold.
#
# + type: (a, b -> a) -> a -> [b] -> a
export fold-left = (f, b, xs) --> ...


# ## Function: scan-left
#
# Similar to fold-left, but returns all intermediate results.
#
# + type: (a, b -> a) -> a -> [a] -> [a]
export scan-left = (f, b, xs) --> ...


# ## Function: scan-right
#
# Similar to fold-right, but returns all intermediate results.
#
# + type: (a, b -> b) -> b -> [a] -> [b]
export scan-right = (f, b, xs) --> ...


# ## Function: iterate
#
# Successively applies f N times.
#  
# + type: Int -> (a -> a) -> a -> [a]
export iterate = (n, f, a) --> ...


# ## Function: repeat
#
# Creates a list with N `a`s.
#
# + type: Int -> a -> [a]
export repeat = (n, a) --> ...


# ## Function: cycle
#
# Creates a list of N items, cycling through items.
#
# + type: Int -> [a] -> [a]
export cycle = (n, xs) --> ...


# ## Function: take
#
# Returns the first N items of the list.
#
# + type: Int -> [a] -> [a]
export take = (n, xs) --> ...


# ## Function: drop
#
# Returns all but the first N items of the list.
#
# + type: Int -> [a] -> [a]
export drop = (n, xs) --> ...


# ## Function: take-while
#
# Returns all first N items that match the predicate.
#
# + type: (a -> Boolean) -> [a] -> [a]
export take-while = (p, xs) --> ...


# ## Function: drop-while
#
# Returns all but the first N items that match the predicate.
#
# + type: (a -> Boolean) -> [a] -> [a]
export drop-while = (p, xs) --> ...


# ## Function: all
#
# Checks if all items pass a predicate test.
#
# + type: (a -> Boolean) -> [a] -> Boolean
export all = (p, xs) --> ...


# ## Function: any
#
# Checks if any items pass a predicate test.
#  
# + type: (a -> Boolean) -> [a] -> Boolean
export any = (p, xs) --> ...


# ## Function: lookup
#
# Treats the list as an alist.
#
# + type: a -> [(a, b)] -> Maybe(b)
export lookup = (a, as) --> ...


# ## Function: concat-map
#
# Maps and concatenates.
#
# + type: (a -> [b]) -> [a] -> [b]
export concat-map = (f, as) --> ...


# ## Function: flatten
#
# Flattens a list of lists.
#
# + type: [[a]] -> [a]
export flatten = (xss) --> ...

