log = require 'loglevel'
@CLASS@Actions = require '../actions/@NAME@.coffee'
Server = require '../api/server.coffee'
LoginStore = require '../stores/login.coffee'

@CLASS@Source =
    load:
        remote: (state, id) -> 
            Server.load@CLASS@ LoginStore.getToken(), id
        local: () -> null
        loading: @CLASS@Actions.load
        success: @CLASS@Actions.loadSuccess
        error: @CLASS@Actions.error

    save:
        remote: (state) -> 
            Server.save@CLASS@ LoginStore.getToken(), state.item
        local: () -> null
        loading: @CLASS@Actions.save
        success: @CLASS@Actions.saveSuccess
        error: @CLASS@Actions.error

    list:
        remote: (state) -> 
            sort = []
            for k, v of state.sort
                switch v
                    when 'desc' then sort.push "#{k} desc"
                    when 'asc' then sort.push k
            Server.list@CLASS@ LoginStore.getToken(), {q:state.q, n:15, p: state.p, sort: sort.join ','}
        local: () -> null
        loading: @CLASS@Actions.list
        success: @CLASS@Actions.listSuccess
        error: @CLASS@Actions.error

    delSelected:
        loading: @CLASS@Actions.delete
        success: @CLASS@Actions.deleteSuccess
        error: @CLASS@Actions.error
        local: () -> null
        remote: (state) ->
            token = LoginStore.getToken()
            selected = _.filter state.objs, (p) -> p.selected
            toDelete = selected.map (obj) ->
                Server.delete@CLASS@ token, obj.id
            Promise.all toDelete

module.exports = @CLASS@Source
