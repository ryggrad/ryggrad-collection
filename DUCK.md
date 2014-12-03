Need to make the underscore methods mixin simpler.

underscoreMethods = ['each', 'map', 'reduce', 'reduceRight', 'find', 'filter', 'where', 'findWhere', 'reject',
                     'every', 'some', 'contains', 'invoke', 'pluck', 'max', 'min', 'sortBy', 'groupBy', 'indexBy',
                     'countBy', 'shuffle', 'sample', 'toArray', 'size', 'partition', 'first', 'last']

for method in underscoreMethods
  Collection.prototype[method] = ->
    return _[method](this, arguments...)

But the problem is the var `method` ends up set to the last element of `underscoreMethods`. Which means you cant
figure out which method needs to be called. I'm fairly certain eval would work but that is ugly.
