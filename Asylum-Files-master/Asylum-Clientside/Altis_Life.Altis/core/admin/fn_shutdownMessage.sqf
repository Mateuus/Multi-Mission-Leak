private["_shell","_bootTime","_bootString","_callUser"];
_callUser = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (life_isRebooting) exitWith{
	[[1,"The server is already running a shut down sequence and will ignore your request."],"life_fnc_broadcast",_callUser,false] spawn life_fnc_MP;
	[["The server is already running a shut down sequence and will ignore your request."],"life_fnc_localChatMessage",_callUser,false] spawn life_fnc_MP;
};
life_isRebooting = true;
_bootString = "<t align='center' size='2' color='#ff0000'>Server Patch</t><br />The server will shut down for a patch in <t underline='true'>%1 minute(s)</t>! We recommend that you press Y and click ""SYNC DATA"" now.  The server will only be down for a few minutes. You can find patch notes on the forums at www.gaming-asylum.com.";
_bootStringSysChat = "The server will shut down for a patch in %1 minute(s)! We recommend that you press Y and click ""SYNC DATA"" now.  The server will only be down for a few minutes. You can find patch notes on the forums at www.gaming-asylum.com.";

[[1, format[_bootString, 15]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
[[format[_bootStringSysChat, 15]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP;
sleep 300;
[[1, format[_bootString, 10]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
[[format[_bootStringSysChat, 10]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP;
sleep 300;
[[1, format[_bootString, 5]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
[[format[_bootStringSysChat, 5]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP;
sleep 240;
[[1, format[_bootString, 1]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
[[format[_bootStringSysChat, 1]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP;
sleep 60;

[] call DB_fnc_saveVehicles;