data.array
==========

[![Build Status](https://secure.travis-ci.org/folktale/data.array.png?branch=master)](https://travis-ci.org/folktale/data.array)
[![NPM version](https://badge.fury.io/js/data.array.png)](http://badge.fury.io/js/data.array)
[![Dependencies Status](https://david-dm.org/folktale/data.array.png)](https://david-dm.org/folktale/data.array)
[![experimental](http://hughsk.github.io/stability-badges/dist/experimental.svg)](http://github.com/hughsk/stability-badges)


Common array operations and combinators


## Example

```js
( ... )
```


## Installing

The easiest way is to grab it from NPM. If you're running in a Browser
environment, you can use [Browserify][]

    $ npm install data.array


### Using with CommonJS

If you're not using NPM, [Download the latest release][release], and require
the `data.array.umd.js` file:

```js
var data-array = require('data.array')
```


### Using with AMD

[Download the latest release][release], and require the `data.array.umd.js`
file:

```js
require(['data.array'], function(data-array) {
  ( ... )
})
```


### Using without modules

[Download the latest release][release], and load the `data.array.umd.js`
file. The properties are exposed in the global `data-array` object:

```html
<script src="/path/to/data.array.umd.js"></script>
```


### Compiling from source

If you want to compile this library from the source, you'll need [Git][],
[Make][], [Node.js][], and run the following commands:

    $ git clone git://github.com/folktale/data.array.git
    $ cd data.array
    $ npm install
    $ make bundle
    
This will generate the `dist/data.array.umd.js` file, which you can load in
any JavaScript environment.

    
## Documentation

You can [read the documentation online][docs] or build it yourself:

    $ git clone git://github.com/folktale/monads.maybe.git
    $ cd monads.maybe
    $ npm install
    $ make documentation

Then open the file `docs/literate/index.html` in your browser.


## Platform support

This library assumes an ES5 environment, but can be easily supported in ES3
platforms by the use of shims. Just include [es5-shim][] :)


## Licence

Copyright (c) 2013 Quildreen Motta.

Released under the [MIT licence](https://github.com/folktale/data.array/blob/master/LICENCE).

<!-- links -->
[Fantasy Land]: https://github.com/fantasyland/fantasy-land
[Browserify]: http://browserify.org/
[release]: https://github.com/folktale/data.array/releases/download/v0.0.0/data.array-0.0.0.tar.gz
[Git]: http://git-scm.com/
[Make]: http://www.gnu.org/software/make/
[Node.js]: http://nodejs.org/
[es5-shim]: https://github.com/kriskowal/es5-shim
[docs]: http://folktale.github.io/data.array
