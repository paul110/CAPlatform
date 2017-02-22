App.sketch = App.cable.subscriptions.create "SketchChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)

  blink: (data) ->
    @perform 'blink', message: data
