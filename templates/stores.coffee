log = require 'loglevel'
alt = require '../alt.coffee'
_ = require 'lodash'

router = require '../routing/router.coffee'
LoginStore = require '../stores/login.coffee'
@CLASS@Actions = require '../actions/@NAME@.coffee'
@CLASS@Source = require '../sources/@NAME@.coffee'

class @CLASS@Store
    constructor: ->
        @state = 
            items: []
            sort: {'time' : 'desc'}
            p: 1
            ready: true
            error: false
            errorMsg: ""

        @bindActions @CLASS@Actions

        @exportAsync @CLASS@Source

    onList: () ->
        @state.ready = false
        @state.error = false
        @emitChange()

    onListSuccess: (res) ->
        @state.ready = true
        @state.items = res.data
        @state.p = res.p
        @state.pageSize = res.pageSize
        @state.numPages = res.numPages
        @state.total = res.total
        @state.ready = true
        @state.error = false
        @state.errorMsg = ""
        @state.anySelected = false
        @state.allSelected = false
        @emitChange()

    onLoad: () ->
        @state.ready = false
        @state.error = false
        @emitChange()

    onLoadSuccess: (res) ->
        @state.item = res
        @state.ready = true
        @state.error = false
        @state.errorMsg = ""
        @emitChange()

    onSave: () ->
        @state.ready = false
        @state.error = false
        @emitChange()

    onSaveSuccess: (res) ->
        @state.item = res
        @state.ready = true
        @state.error = false
        @state.errorMsg = ""
        @emitChange()

    onDelete: () ->
        @state.ready = false
        @state.error = false
        @emitChange()

    onDeleteSuccess: () ->
        @state.ready = true
        @state.error = false
        @state.errorMsg = ""
        @emitChange()

    onToggleSelection: (item) ->
        item.selected = !item.selected
        @state.anySelected = _.some @state.items, (p) -> !!p.selected
        @state.allSelected = _.every @state.items, (p) -> !!p.selected
        @emitChange()

    onToggleSelectAll: (id) ->
        all = !@state.allSelected
        for u in @state.items
            u.selected = all
        @state.allSelected = all
        @state.anySelected = all
        @emitChange()

    onError: (msg) ->
        @state.ready = true
        @state.error = true
        @state.errorMsg = msg
        @emitChange()

    onSearch: (q) ->
        @state.q = q
        @emitChange()

    onSetSort: ({field, order}) ->
        @state.sort[field] = order
        @emitChange()

    onNextPage: () ->
        @state.p += 1
        if @state.p > @state.numPages
            @state.p = @state.numPages
        @emitChange()

    onPrevPage: () ->
        @state.p -= 1
        if @state.p < 1
            @state.p = 1
        @emitChange()

module.exports = alt.createStore @CLASS@Store, '@CLASS@Store'
