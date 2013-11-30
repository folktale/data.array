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


fold-right = require '../folds/fold-right'
rest       = require '../common/rest'


# # Function: zip-withN
#
# Zips a list of lists with a function.
#  
# + type: (a1, a2, ..., aN -> b) -> [(a1, a2, ..., aN)] -> [b]
zip-withN = (f, xss) -->
  | xss.length < 0  => throw new Error "Needs at least two lists to zip."
  | otherwise       => do
                       ensure-lengths-are-equal xss
                       [f.apply null, xs for xs in xss]


function ensure-lengths-are-equal(xss) =>
  (rest xss) |> fold-right xss.0, verify-lengths


function verify-lengths(as, bs) => switch
  | as.length != bs.length => throw new Error "Can't zip lists of different lengths."
  | otherwise              => as


module.exports = zip-withN
