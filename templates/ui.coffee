log = require 'loglevel'
riot = require 'riot'
_ = require 'lodash'

BASE = 'app.admin' # XXX
router = require '../routing/router.coffee'
{storeMixin, routingMixin, loginRequired} = require './mixins.coffee'
@CLASS@Store = require '../stores/@NAME@.coffee'
@CLASS@Actions = require '../actions/@NAME@.coffee'
require './sort.coffee'

searchDebounce = 500

riot.tag '@NAME@', require('../html/@NAME@.jade'), (opts) ->
    @mixin(storeMixin(@CLASS@Store), routingMixin)

riot.tag '@NAME@list', require('../html/@NAME@list.jade'), (opts) ->
    @mixin(
        storeMixin @CLASS@Store
        routingMixin
    )
    @on 'mount', ->
        @CLASS@Store.list false

    @refresh = ->
        @CLASS@Store.list false

    @select = (e) -> @CLASS@Actions.toggleSelection e.item

    @onSearch = _.debounce ((e) =>
        @CLASS@Actions.search e.target.value
        @CLASS@Store.list false
    ), searchDebounce

    @setSort = (e) ->
        @CLASS@Actions.setSort e.data
        @CLASS@Store.list false

    @delSelected = @CLASS@Store.delSelected

    @view@CLASS@ = (e) ->
        router.go "#{BASE}.@NAME@.detail", {id: e.item.id}
        true

    @nextPage = () ->
        @CLASS@Actions.nextPage()
        @CLASS@Store.list false

    @prevPage = () ->
        @CLASS@Actions.prevPage()
        @CLASS@Store.list false

    @selectAll = @CLASS@Actions.toggleSelectAll


riot.tag '@NAME@detail', require('../html/@NAME@detail.jade'), (opts) ->
    @mixin(
        routingMixin
        storeMixin @CLASS@Store
    )

    @on 'mount', ->
        @CLASS@Store.load opts.id

    @reset = (e) ->
        @CLASS@Store.load opts.id

    @save = (e) ->
        @CLASS@Store.save()


router.addState
    name: "#{BASE}.@NAME@"
    data: {}
    route: '/@NAME@'
    template: '@NAME@'
    defaultChild: 'list'
    resolve: loginRequired('Admin')

router.addState
    name: "#{BASE}.@NAME@.list"
    data: {}
    route: '/list'
    template: '@NAME@list'

router.addState
    name: "#{BASE}.@NAME@.detail"
    data: {}
    route: '/detail/:id'
    template: '@NAME@detail'
    resolve: (data, parameters, cb) ->
        cb null, {uid: unescape(parameters.id)}
