# Import
{Controller, Interface} = @

class @Application

	constructor : ->
		controller = new Controller
		
		ui = new Interface
			sections : ['#area', '#toolbar']
			buttons  : ['#clear', '#start', "#pause", '#apply']
			inputs   : ['#frequency']
			canvas   : '#areaCanvas'
		
		ui.link controller
		
		canvas = ui.canvas.get()
		
		controller.init
			canvas : canvas
			width  : canvas.width
			height : canvas.height
			