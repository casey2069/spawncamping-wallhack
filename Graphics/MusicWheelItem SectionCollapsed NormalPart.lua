local t =  Def.ActorFrame{
	InitCommand=function(self)
		self:diffusealpha(0.8)
	end
}


t[#t+1] = Def.Quad{
	InitCommand= function(self) 
		self:x(0)
		self:zoomto(capWideScale(get43size(340),340),44)
		self:halign(0)
	end;
	SetCommand = function(self)
		self:diffuse(color("#000000"))
	end;
	BeginCommand = function(self) self:queuecommand('Set') end;
	OffCommand = function(self) self:visible(false) end;
}


t[#t+1] = Def.Quad{
	InitCommand= function(self) 
		self:x(30)
		self:zoomto(2,32)
		self:halign(0)
	end;
	BeginCommand = function(self) self:queuecommand('Set') end;
	OffCommand = function(self) self:visible(false) end;
}

t[#t+1] = Def.Banner{
	InitCommand = function(self)
		self:fadeleft(1)
		self:halign(1)
		self:x(340)
	 	self:scaletoclipped(capWideScale(get43size(340),340),44)
	 	self:diffusealpha(0.3)
	end;
	SetMessageCommand = function(self,params)
		local group = params.Text
		if group then
			self:LoadFromSongGroup(group)
		else
			self:Load(THEME:GetPathG("Common fallback","banner"))
		end
	end;
}

return t
