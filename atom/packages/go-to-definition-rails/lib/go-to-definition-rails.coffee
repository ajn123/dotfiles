GoToDefinitionRailsView = require './go-to-definition-rails-view'
{CompositeDisposable} = require 'atom'

module.exports = GoToDefinitionRails =
  subscriptions: null
  finder: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'go-to-definition-rails:goToMethodDefinition': => @goToMethodDefinition()
    @subscriptions.add atom.commands.add 'atom-workspace', 'go-to-definition-rails:goToClassMethodDefinition': => @goToClassMethodDefinition()

  deactivate: ->
    @subscriptions.dispose()
    @finder.cancel() if @finder?

  goToMethodDefinition: ->
    workspace = atom.workspace
    editor = workspace.getActivePaneItem()
    current_word = editor.getWordUnderCursor()
    @goTo(///def\s+#{current_word}///)

  goToClassMethodDefinition: ->
    workspace = atom.workspace
    editor = workspace.getActivePaneItem()
    current_word = editor.getWordUnderCursor()
    @goTo(///def\s+(self\.)#{current_word}///)

  goTo: (regex) ->
    @finder.cancel() if @finder?

    @finder = finder = atom.workspace.defaultDirectorySearcher.search(atom.project.rootDirectories, regex, {
      inclusions: ['*.rb']
      didMatch: (searchResult) ->
        atom.workspace.open(searchResult.filePath, { initialLine: searchResult['matches'][0].range[0][0] })
        finder.cancel()
      didError: () ->
      didSearchPaths: () ->
    })
# method1
