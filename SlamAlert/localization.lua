--Language Localization-----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

SA_VERSION = 3.10;

--English--------------------------------------------------
-----------------------------------------------------------
if (GetLocale() == "enUS") then
	SA_TEXT_WELCOME = "Slam Alert v"..SA_VERSION.." Loaded |cff20ff20(/SA for options)";
	SA_TEXT_SLASHCOMMAND = "|cff20ff20/SA off|cffffffff -Turn SA off\n|cff20ff20/SA on|cffffffff -Turn SA on\n|cff20ff20/SA toggle|cffffffff -Toggle SA on/off\n|cff20ff20/SA status|cffffffff - Shows SA's status (ON/OFF for SA, sound notification and displayed message)\n|cff20ff20/SA soundon or /SA son|cffffffff - Turns on the sound notification";
	SA_TEXT_SLASHCOMMAND2 = "|cff20ff20/SA soundoff or /SA soff|cffffffff - Turns off the sound notification\n|cff20ff20/SA messageon or /SA mon|cffffffff - Turns on the displayed message\n|cff20ff20/SA messageoff or /SA moff|cffffffff - Turns off the displayed message\n|cff20ff20/SA options or /SA option|cffffffff - Opens the SA Options Menu";
	
	SA_TEXT_SA_OFF = "Slam Alert is now: |cffff2020-OFF-";
	SA_TEXT_SA_ON = "Slam Alert is now: |cff20ff20-ON-";
	
	SA_TEXT_MESSAGE_OFF = "Slam Alert's Message is now: |cffff2020-OFF-";
	SA_TEXT_MESSAGE_ON = "Slam Alert's Message is now: |cff20ff20-ON-";
	
	SA_TEXT_SOUND_OFF = "Slam Alert's Sound is now: |cffff2020-OFF-";
	SA_TEXT_SOUND_ON = "Slam Alert's Sound is now: |cff20ff20-ON-";
	
	SA_TEXT_SA_STOFF = "Slam Alert is: |cffff2020-OFF-";
	SA_TEXT_SA_STON = "Slam Alert is: |cff20ff20-ON-";
	
	SA_TEXT_MESSAGE_STOFF = "Slam Alert's Message is: |cffff2020-OFF-";
	SA_TEXT_MESSAGE_STON = "Slam Alert's Message is: |cff20ff20-ON-";
	
	SA_TEXT_SOUND_STOFF = "Slam Alert's Sound is: |cffff2020-OFF-";
	SA_TEXT_SOUND_STON = "Slam Alert's Sound is: |cff20ff20-ON-";

	SA_SLAM = "Slam!";

	SA_OPTIONS = "Slam Alert Options"
	SA_OPTIONS_VERSION = "Version "..SA_VERSION.." by Riger"
	SA_OPTIONS_STATUS = "Show Status"
	SA_OPTIONS_TOGGLE = "Slam Alert Toggle (On/Off)"
	SA_OPTIONS_SOUND = "Sound Toggle (On/Off)"
	SA_OPTIONS_MESSAGE = "Message Toggle (On/Off)"
	SA_OPTIONS_CLOSE = "Close"
end
