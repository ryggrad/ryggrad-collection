should     = require('chai').should()
Collection = require '../lib/ryggrad-collection'
_          = require 'underscore'

underscoreMethods = ['each', 'map', 'reduce', 'reduceRight', 'find', 'filter', 'where', 'findWhere', 'reject',
                     'every', 'some', 'contains', 'invoke', 'pluck', 'max', 'min', 'sortBy', 'groupBy', 'indexBy',
                     'countBy', 'shuffle', 'sample', 'toArray', 'size', 'partition', 'first', 'last']

describe "Collection", ->
  it "should construct a new collection", ->
    collection = new Collection()
    collection.should.be.an.instanceof(Collection)
  
  it "should add a record to the collection", ->
    collection = new Collection()
    cat = name: "Snow, Ballz"
    collection.add(cat)
    collection.first().should.equal cat

  it "should return a count", ->
    collection = new Collection()
    collection.add([{}, {}, {}])
    collection.count().should.equal 3
 
  it "should remove a record from the collection", ->
    collection = new Collection()
    bob = name: "Not Bob", id: "Doe"
    collection.add([{}, {}, bob])
    collection.findById(bob.id).should.not.be.false
    collection.remove(bob)
    collection.count().should.equal 2
    collection.findById(bob.id).should.be.false
 
  it "should remove all records from the collection", ->
    collection = new Collection()
    collection.add([{}, {}, {}])
    collection.removeAll()
    collection.count().should.equal 0
 
  it "should return a record by id", ->
    collection = new Collection()
    bob = name: "Not Bob", id: "Doe"
    collection.add(bob)
    collection.findById(bob.id).should.not.be.false
 
  it "should have methods for all the underscore collection functions", ->
    for method in underscoreMethods
      Collection.prototype.hasOwnProperty(method).should.be.true

  it "should return records that match a filter function", ->
    collection = new Collection()
    bob   = name: "Not Bob", id: "Doe", human: true
    cat   = name: "Snow, Sucks", id: "cat", human: false
    jerry = name: "Awesome", id: "what", human: true
    collection.add([bob, cat, jerry])

    humans = collection.filter (animal) -> animal.human
    humans.length.should.equal 2

  it "should return records that have specific properties", ->
    collection = new Collection()
    bob   = name: "Not Bob", id: "Doe", human: true
    cat   = name: "Snow, Sucks", id: "cat", human: false
    jerry = name: "Awesome", id: "what", human: true
    collection.add([bob, cat, jerry])
  
    humans = collection.where(name: "Awesome")
    humans.length.should.equal 1
