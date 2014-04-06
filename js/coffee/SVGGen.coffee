config =
	rect:
		type: "rect"
		el: "header"
		width: 300
		height: 40
		lineColor: "#333"
		strokeWidth: 2
		
	

extend = (target, obj) ->
	obj[key] = value for own key, value of target

class SVGEl
	constructor: (@config) ->
		@svg = SVGEl.generator[@config.type] config
		sibling = document.querySelectorAll('[data-svgel="' + @config.el + '"]')[0]
		elem = document.createElement 'div'
		elem.innerHTML = @svg
		sibling.parentNode.insertBefore elem, sibling.nextSibling

	@generator = 
		rect: (config) ->
			"<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 #{config.width} #{config.height}' height='#{config.height}' width='#{config.width}'>
				<rect x='0' y='0' height='#{config.height}' width='#{config.width}' stroke-width='#{config.strokeWidth}' style='stroke: #{config.lineColor}; fill: transparent'/>
			</svg>"
		circle: (config) ->


test = new SVGEl(config.rect)