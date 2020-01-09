--°°Big thanks to Shantalya helping me to create this little addon.°°--
	

--Left
MultiBarLeft.lastUpdate = 0;
MultiBarLeft:SetScript("OnUpdate", function(self, elapsed)
	self.lastUpdate = self.lastUpdate + elapsed;
	if ( self.lastUpdate > 0.5 ) then
		if ( MouseIsOver(MultiBarLeft) ) then
			MultiBarLeft:SetAlpha(1);
		else
			MultiBarLeft:SetAlpha(0);
		end
	end
end)

--Right
MultiBarRight.lastUpdate = 0;
MultiBarRight:SetScript("OnUpdate", function(self, elapsed)
	self.lastUpdate = self.lastUpdate + elapsed;
	if ( self.lastUpdate > 0.5 ) then
		if ( MouseIsOver(MultiBarRight) ) then
			MultiBarRight:SetAlpha(1);
		else
			MultiBarRight:SetAlpha(0);
		end
	end
end)