{Cell} = @

# Singleton
class @FieldManager
	
	## Private
	field    = []
	newfield = []
	
	width  = null
	height = null
	
	c = (x, y) ->
		return field[x]?[y]?.alive or 0
	
	## Public
	constructor : ->
	
	init : (hash) ->
		{width, height} = hash
		
		width  =  (width/Cell::size).floor()
		height = (height/Cell::size).floor()
		
		do @clearField
		
	link : (@gm) ->
		gm.applySize Cell::size
	
	clearField : ->
		# Iterating through each cell
		width.times (x) ->
			field[x]    = []
			newfield[x] = []
			
			height.times (y) ->
				field[x][y]    = new Cell x, y
				newfield[x][y] = new Cell x, y
				
		do @gm.clearField
	
	touch : (point) ->
		{gm} = @
		
		x = (point.x/Cell::size).floor()
		y = (point.y/Cell::size).floor()
		
		cell    = field[x][y]
		newcell = newfield[x][y]
		
		# Checking mode
		if cell.alive
			do cell.kill  for cell in [cell, newcell] 
			
			gm.clear cell
		else
			do cell.renew for cell in [cell, newcell]
			
			gm.draw cell
		
	stage : ->
		{gm} = @
				
		# Iterating through each cell
		width.times (x) ->
			height.times (y) ->
				cell = newfield[x][y]
				
				# Counting summ
				summ = c(x, y-1) + c(x, y+1) +
					c(x-1, y-1) + c(x-1, y) + c(x-1, y+1) +
					c(x+1, y-1) + c(x+1, y) + c(x+1, y+1)
					
				# Checking rules
				if cell.alive and summ isnt 2 and summ isnt 3
					do cell.kill
					
					gm.clear cell
					
				else if !cell.alive and summ is 3
					do cell.renew
					
					gm.draw cell
					
		# Copying field
		width.times (x) ->
			height.times (y) ->
				field[x][y].alive = newfield[x][y].alive
