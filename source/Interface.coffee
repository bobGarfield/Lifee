class @Interface
	
	constructor : (elements) ->	
		@sections = {}
		@buttons  = {}
		@inputs   = {}
		
		for id in elements.sections
			@sections[id.replace '#', ''] = $ id
			
		for id in elements.buttons
			@buttons[id.replace '#', '']  = $ id
			
		for id in elements.inputs
			@inputs[id.replace '#', '']  = $ id
			
		@canvas = $ elements.canvas
	
	link : (@controller) ->
		do @bindEvents
	
	bindEvents : ->
		{buttons, inputs, controller, canvas} = @
	
		buttons.start.bind 'click', ->
			do controller.start
			
			@style.background = '#5f5'
			
		buttons.pause.bind 'click', ->
			do controller.pause
			
			buttons.start.css
				background : '#f55'
			
		buttons.clear.bind 'click', ->
			do controller.clear
			
		buttons.apply.bind 'click', ->
			controller.apply 
				frequency : inputs.frequency.first.value
			
		canvas.bind 'click', (event) ->			
			{layerX, layerY} = event
			
			controller.touch layerX, layerY