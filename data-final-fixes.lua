local facing = settings.startup["hazard-concrete-facing"].value -- "left" or "right"

local function unify_graphics(prefix)
	local left = data.raw["tile"][prefix .. "-left"]
	local right = data.raw["tile"][prefix .. "-right"]
	if not (left and right) then return end

	local source = (facing == "left") and left or right
	if not source.variants then return end

	if source.variants.material_background then
		left.variants.material_background = table.deepcopy(source.variants.material_background)
		right.variants.material_background = table.deepcopy(source.variants.material_background)
	end

	if source.variants.material_light then
		left.variants.material_light = table.deepcopy(source.variants.material_light)
		right.variants.material_light = table.deepcopy(source.variants.material_light)
	end
end

unify_graphics("hazard-concrete")
unify_graphics("refined-hazard-concrete")