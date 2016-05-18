local t = Def.ActorFrame{}
t[#t+1] = LoadActor("../_frame");

--Group folder name
local frameWidth = 280
local frameHeight = 20
local frameX = SCREEN_WIDTH
local frameY = 10

t[#t+1] = Def.Quad{
	InitCommand=cmd(xy,frameX,frameY;halign,1;zoomto,frameWidth,frameHeight;diffuse,getMainColor('highlight'););
};

t[#t+1] = LoadFont("Common Normal") .. {
	InitCommand=cmd(xy,frameX-frameWidth+5,frameY;halign,0;zoom,0.45;maxwidth,(frameWidth-10)/0.45);
	BeginCommand=cmd(queuecommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		local course = GAMESTATE:GetCurrentCourse()
		if song ~= nil and (not GAMESTATE:IsCourseMode()) then
			self:settext(song:GetGroupName())
		end;
		if course ~= nil and GAMESTATE:IsCourseMode() then
			self:settext(course:GetGroupName())
		end;
	end;
};

t[#t+1] = LoadActor("../_cursor");

return t