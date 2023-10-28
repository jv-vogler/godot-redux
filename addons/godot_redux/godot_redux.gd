@tool
class_name Redux
extends EditorPlugin


static func combineReducers(reducers):
	pass


class Store:
	var _state
	var _subscriptions = []
	var _reducer

	func _init(reducer, initialState):
		_state = initialState
		_reducer = reducer

	func getState():
		return _state

	func dispatch(action):
		_state = _reducer.call(_state, action)
		_notifySubscriptions()

	func subscribe(listener):
		_subscriptions.append(listener)

	func _notifySubscriptions():
		for subscription in _subscriptions:
			subscription.call()
