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

replicate = require '../building/replicate'
 

# # Function: unzip
#
# Transforms a list of pairs into a list of each component.
#  
# + type: [(a1, a2, ..., aN)] -> ([a1], [a2], ..., [aN])
unzip = (xss) ->
  | xss.length is 0 => []
  | otherwise       => do
                       expected-length = xss.0.length
                       result = [replicate expected-length, []]
                       for xs in xss => do
                                        ensure-length expected-length, xs.length
                                        for x,i in xss => result[i].push x
                       return result


function ensure-length(a, b)
  if a != b => throw new Error "Can't unzip lists with varying list lengths."


module.exports = unzip
