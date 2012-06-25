class @Cell
	
	size : 10
	
	constructor : (x, y) ->
		hsize = @size/2
		
		@point = 
			'x' : x*@size+hsize
			'y' : y*@size+hsize
			
		@alive = 0
		
	renew : ->
		@alive = 1
		
	kill : ->
		@alive = 0
			
