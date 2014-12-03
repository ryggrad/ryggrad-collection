{Sequence}  = require 'theorist'
_           = require 'underscore'

underscoreMethods = ['each', 'map', 'reduce', 'reduceRight', 'find', 'filter', 'where', 'findWhere', 'reject',
                     'every', 'some', 'contains', 'invoke', 'pluck', 'max', 'min', 'sortBy', 'groupBy', 'indexBy',
                     'countBy', 'shuffle', 'sample', 'toArray', 'size', 'partition', 'first', 'last']

class Collection extends Sequence
  constructor: ->
    @ids = {}
    super

  count: -> @length

  add: (records) ->
    if _.isArray(records)
      for record in records
        @ids[record.id] = record if record.id?
        record.index = @length
        @push(record)
    else
      @ids[records.id] = records if records.id?
      records.index = @length
      @push(records)

  findById: (id) ->
    record = @ids[id]
    return record if record
    false

  remove: (records) ->
    return @removeAll() if records.length is @length
    if _.isArray(records)
      for record in records
        delete @ids[record.id] if record.id?
        @splice(record.index, 1)
    else
      delete @ids[records.id] if records.id?
      @splice(records.index, 1)
  
  removeAll: ->
    @ids = {}
    @setLength(0)
  
  ###
  # TODO
  # Cleverly shorten this
  ###

  each:        -> _.each(@,        arguments...)
  map:         -> _.map(@,         arguments...)
  reduce:      -> _.reduce(@,      arguments...)
  reduceRight: -> _.reduceRight(@, arguments...)
  find:        -> _.find(@,        arguments...)
  filter:      -> _.filter(@,      arguments...)
  where:       -> _.where(@,       arguments...)
  findWhere:   -> _.findWhere(@,   arguments...)
  reject:      -> _.reject(@,      arguments...)
  every:       -> _.every(@,       arguments...)
  some:        -> _.some(@,        arguments...)
  contains:    -> _.contains(@,    arguments...)
  invoke:      -> _.invoke(@,      arguments...)
  pluck:       -> _.pluck(@,       arguments...)
  max:         -> _.max(@,         arguments...)
  min:         -> _.min(@,         arguments...)
  sortBy:      -> _.sortBy(@,      arguments...)
  groupBy:     -> _.groupBy(@,     arguments...)
  indexBy:     -> _.indexBy(@,     arguments...)
  countBy:     -> _.countBy(@,     arguments...)
  shuffle:     -> _.shuffle(@,     arguments...)
  sample:      -> _.sample(@,      arguments...)
  toArray:     -> _.toArray(@,     arguments...)
  size:        -> _.size(@,        arguments...)
  partition:   -> _.partition(@,   arguments...)
  first:       -> _.first(@,       arguments...)
  last:        -> _.last(@,        arguments...)

module.exports = Collection
