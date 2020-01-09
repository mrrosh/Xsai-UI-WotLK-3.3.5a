if IsAddOnLoaded("ButtonFacade") then

local GB = "Geist"
local BF = LibStub("AceAddon-3.0"):GetAddon("ButtonFacade")
local LBF = LibStub("LibButtonFacade", true)
local GeistBF = BF:NewModule(GB)

local defaults	= {
	profile = {
		["*"] = {
			Skin = "Blizzard",
			Gloss = 0,
			Backdrop = false,
			Colors = {},
		},
	},
}

if LBF and GeistBF then
	function GeistBF:OnInitialize()
		self.db = self:RegisterNamespace(GB, defaults)
	end

	function GeistBF:SkinCallback(skin, gloss, backdrop, group, button, colors)
		if not group then return end
		self.db.profile[group].Skin = skin
		self.db.profile[group].Gloss = gloss
		self.db.profile[group].Backdrop = backdrop
		self.db.profile[group].Colors = colors
	end

	function GeistBF:SetupGroup(group)
		local geistgroup = LBF:Group(GB, group)
		-- probably prettier ways to do this, but it works for now
		for i = 1, Geist["Buttons"] do
			local button = getglobal("GeistButton"..i)
			if button then
				geistgroup:AddButton(button)
			end
		end
		geistgroup:Skin(self.db.profile[group].Skin, self.db.profile[group].Gloss, self.db.profile[group].Backdrop, self.db.profile[group].Colors)
	end

	function GeistBF:Load()
		self:SetupGroup("Geist Buttons")
		LBF:RegisterSkinCallback(GB, self.SkinCallback, self)
	end

	function GeistBF:OnEnable()
		self:Load()
	end
end

end
