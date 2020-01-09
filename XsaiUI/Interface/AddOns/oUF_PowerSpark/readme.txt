Only works for one frame. As long as you 
want the spark on your player frame load 
order won't matter but to work on another 
frame you should OptDep oUF_PowerSpark as 
on load it only looks for a spark on the 
player frame.

Here's an example:

	if unit == "player" then
		-- Power spark!
		local spark = pp:CreateTexture(nil, "OVERLAY")
		spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
		spark:SetVertexColor(1, 1, 1, 0.5)
		spark:SetBlendMode("ADD")
		spark:SetHeight(pp:GetHeight()*2)
		spark:SetWidth(pp:GetHeight())
		--  Options and settings
		--spark.rtl = true
		--    Make the spark go from Right To Left instead
		--    Defaults to false
		--spark.manatick = true
		--    Show mana regen ticks outside FSR (like the energy ticker)
		--    Defaults to false
		--spark.highAlpha = 1
		--    What alpha setting to use for the FSR and energy spark
		--    Defaults to spark:GetAlpha()
		--spark.lowAlpha = 0.25
		--    What alpha setting to use for the mana regen ticker
		--    Defaults to highAlpha / 4
		self.Spark = spark
	end

Experiment with Texture, VertexColor, 
BlendMode, Height and Width to make the 
spark look like you want!


If you change any settings on the go you need to call

	oUF_PowerSpark_ReapplySettings([object])

to make oUF_PowerSpark grab the new settings.
object is the frame to get the spark from. 
(Defaults to oUF.units["player"])
