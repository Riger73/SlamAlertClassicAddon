--[[

	Slam!Alert by Riger 2022: ---------
		Original code by Malivil, Based off "Overpower Alert" code
		copyright 2005 by Interceptor
		Inspired by "Combat Sentry Gizmo" code
	V 3.30

]]--

------------------------------------------------------------------

SA_expirationTime = 0 ;

-- // Register slash commands // --
function SA_SlashCommand(msg)
	SlamAlertOptions:Hide();
	if ( msg == "help" or msg == "" ) then
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SLASHCOMMAND);
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SLASHCOMMAND2);
	elseif ( msg == "on" ) then
		SlamAlert.on = 1;			
		SlamAlert.soundon = 1;			
		SlamAlert.messageon = 1;			
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SA_ON);
	elseif ( msg == "off" ) then
		SlamAlert.on = 0;			
		SlamAlert.soundon = 0;			
		SlamAlert.messageon = 0;			
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SA_OFF);
	elseif ( msg == "toggle" ) then
		if ( not SlamAlert.on or SlamAlert.on == 0 ) then
			SlamAlert.on = 1;			
			SlamAlert.soundon = 1;			
			SlamAlert.messageon = 1;			
			DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SA_ON);
		else
			SlamAlert.on = 0;			
			SlamAlert.soundon = 0;			
			SlamAlert.messageon = 0;			
			DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SA_OFF);
		end
	elseif ( msg == "status" ) then
		SA_Status();
	elseif ( (msg == "messageon") or (msg == "mon") ) then
		SlamAlert.messageon = 1;		
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_MESSAGE_ON);
	elseif ( (msg == "messageoff") or (msg == "moff") ) then
		SlamAlert.messageon = 0;		
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_MESSAGE_OFF);
	elseif ( (msg == "soundon") or (msg == "son") ) then
		SlamAlert.soundon = 1;		
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SOUND_ON);
	elseif ( (msg == "soundoff") or (msg == "soff") ) then
		SlamAlert.soundon = 0;
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SOUND_OFF);
	elseif ( (msg == "options") or (msg == "option") ) then
		SlamAlertOptions:Show();
	else		
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SLASHCOMMAND);
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SLASHCOMMAND2);
	end
end

function SA_OnLoad(self)
	-- Register events
	self:RegisterEvent("VARIABLES_LOADED");
	self:RegisterEvent("UNIT_AURA");

	SLASH_SA1 = "/SlamAlert";
	SLASH_SA2 = "/SA"

	SlashCmdList["SA"] = SA_SlashCommand;
end


function SA_OnEvent(self, event, ...)

	if( event == "VARIABLES_LOADED" ) then

		if not (SlamAlert) then
			SlamAlert = {};
		end
		if not (SlamAlert.on) then
			SlamAlert.on = 1 ;
		end
		if not (SlamAlert.messageon) then
			SlamAlert.messageon = 1 ;
		end
		if not (SlamAlert.soundon) then
			SlamAlert.soundon = 1 ;
		end
	end
	
	
	if (not SlamAlert.on or SlamAlert.on == 0) then
		return;
	end	
	
	if (event == "UNIT_AURA" and ... == "player" ) then
	
		--local name, _, _, _, _, _, expirationTime = UnitBuff("player","Slam!") ;
		--local LibAuras = LibStub:GetLibrary("LibAuras")
		local name, _, _, _, _, expirationTime = AuraUtil.FindAuraByName("Slam!","player")

		if name == "Slam!" then
			if SA_expirationTime < expirationTime then
				SA_expirationTime = expirationTime ;
				SA_Alert();		
			end
		end
	end
	

end


function SA_Alert()
	if ( SlamAlert.on == 1 ) then
		if (SlamAlert.soundon == 1) then
			PlaySoundFile("Interface\\AddOns\\SlamAlert\\Sounds\\sa.ogg","MASTER");
		end
		if (SlamAlert.messageon == 1) then
			SAlertMessageFrame:AddMessage("SLAM!", 1, 1, 1, 1, 1);
		end
	end
end

function SA_OnOff()
	if ( SlamAlert.on == 0 ) then
		SlamAlert.on = 1;
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SA_STON);
	else
		SlamAlert.on = 0;
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SA_STOFF);
	end
end

function SA_SoundOnOff()
	if ( SlamAlert.soundon == 0 ) then
		SlamAlert.soundon = 1;
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SOUND_STON);
	else
		SlamAlert.soundon = 0;
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SOUND_STOFF);
	end
end

function SA_MessageOnOff()
	if ( SlamAlert.messageon == 0 ) then
		SlamAlert.messageon = 1;
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_MESSAGE_STON);
	else
		SlamAlert.messageon = 0;
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_MESSAGE_STOFF);
	end
end

function SA_Status()
	if ( SlamAlert.on == 1 ) then
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SA_STON);
	else
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SA_STOFF);
	end
	if ( SlamAlert.messageon == 1 ) then
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_MESSAGE_STON);
	else
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_MESSAGE_STOFF);
	end
	if ( SlamAlert.soundon == 1 ) then
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SOUND_STON);
	else
		DEFAULT_CHAT_FRAME:AddMessage(SA_TEXT_SOUND_STOFF);
	end
end
