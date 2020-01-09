local sbf = _G["SBF"]
local tables = {}
local created = 0
local out = 0

sbf.GetTable = function(self)
	if (#tables == 0) then
    created = created + 1
    out = out + 1
		return {}
	end
  out = out + 1
	return table.remove(tables, 1)
end

sbf.PutTable = function(self, t, topOnly)
	if not t then
		return
	end
  if t.auraType and t.name then
    if t.isMirror then
      self:debugmsg(256, format("PutTable called for |cff00ffaa%s (mirror)", t.name))
    else
      self:debugmsg(256, format("PutTable called for |cff00ffaa%s", t.name))
    end
  end
	for k,v in pairs(t) do
		if (type(v) == "table") and not topOnly and not v.IsObjectType and (string.byte(k, 1) ~= 95) then
			self:PutTable(v)
		end
		t[k] = nil
	end
  out = out - 1
	table.insert(tables, t)
end

sbf.CopyTable = function(self, src)
	local dst = self:GetTable()
	for k,v in pairs(src) do
		if (type(v) == "table") and not v.IsObjectType and (string.byte(k, 1) ~= 95) then
			dst[k] = self:CopyTable(v)
		else
			dst[k] = v
		end
	end
	return dst
end

sbf.TableStats = function(self)
  self:Print(format("%d tables created: %d out, %d in", created, out, #tables))
end