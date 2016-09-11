{CompositeDisposable} = require 'atom'

module.exports = InsertBr =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-text-editor', 'insert-br:insert': => @insert()

  deactivate: ->
    @subscriptions.dispose()

  insert: ->
    editor = atom.workspace.getActiveTextEditor()
    editor?.insertText('<br/>')
