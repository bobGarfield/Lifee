# Singleton
class @GraphicManager
	
	## Private
	ctx = null
	cvs = null
	
	## Public
	constructor : ->
	
	init : (hash) ->
		{interval} = hash
		
		cvs = hash.canvas
		
		ctx = cvs.getContext '2d'
		
		ctx.fillStyle   = '#111'
		ctx.strokeStyle = '#aaa'
		
		do @clearField
		
	applySize : (@cellSize) ->
		
	draw : (cell) ->
		{point} = cell
		
		x = point.x
		y = point.y
		
		hsize = @cellSize/2
		
		ctx.fillRect x-hsize, y-hsize, @cellSize, @cellSize
		
	clear : (cell) ->
		{point} = cell
		
		hsize = @cellSize/2
		
		ctx.clearRect point.x-hsize+0.05, point.y-hsize+0.05, @cellSize-0.1, @cellSize-0.1
		
	clearField : ->
		{width, height} = cvs
		
		ctx.clearRect 0, 0, ctx.canvas.width, ctx.canvas.height
		
		do ctx.beginPath
		
		for x in  [0..width] by @cellSize
			ctx.moveTo x, 0
			ctx.lineTo x, height
			
		for y in [0..height] by @cellSize
			ctx.moveTo 0, y
			ctx.lineTo width, y
			
		do ctx.closePath
		do ctx.stroke
		
		
		