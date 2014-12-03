# ryggrad-collection [![Build Status](https://travis-ci.org/ryggrad/ryggrad-collection.svg?branch=master)](https://travis-ci.org/ryggrad/ryggrad-collection)

A class for managing collections of objects. 
Supports all the [underscore Collection methods](http://underscorejs.org/#collections) and quakes like an Array. 
It is used as the basis for [ryggrad-model](https://github.com/ryggrad/ryggrad-model)

## Installation and Usage

It is designed to be used through node or browserify; so npm is the only way to get it:

    $ npm install ryggrad-collection --save

Then require it and add some stuff

~~~~coffeescript
Collection = require 'ryggrad-collection'
cats = new Collection()
cat = name: "Snow, Ballz"
collection.add(cat)
~~~~

You can treat it much like you would an Array (it inherits from the Array object):

~~~~coffeescript
cat2 = name: "The Lord"
cats.push cat2
console.log cats[1] # => {name: "The Lord"}
~~~~

etc...

See spec/spec.coffee for further usage examples.
