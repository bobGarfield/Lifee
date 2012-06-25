{FieldManager, GraphicManager} = @

# Singleton
class @Controller
	
	## Private
	frequency = 1000/25
	
	## Public
	constructor : ->
		@fieldManager   = new FieldManager
		@graphicManager = new GraphicManager
	
	init : (hash) ->
		@graphicManager.init hash
		
		@fieldManager.link @graphicManager
		
		@fieldManager.init hash
		
	apply : (hash) ->
		frequency = 1000/hash.frequency
		
	start : ->
		clearInterval @process if @process
		
		@process = setInterval (=>
			do @fieldManager.stage),
		frequency
		
	pause : ->
		clearInterval @process
		
	clear : ->
		do @fieldManager.clearField
		
	touch : (x, y) ->
		point = 
			'x' : x
			'y' : y

		@fieldManager.touch point