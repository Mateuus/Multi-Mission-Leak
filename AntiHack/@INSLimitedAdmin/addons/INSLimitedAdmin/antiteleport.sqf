_1st = "
_hacklock = false;
_player = name player;
_uid = getPlayerUID vehicle player;
_banmessage = INSLimitedAdminServerVariables select 11;
broadcast_serv00211 = 0;

while {true} do 
{
waitUntil{alive player};
_pos1 = (getpos (vehicle player));
sleep 1;
_pos2 = (getpos (vehicle player));
_tpcheck = _pos1 distance _pos2; 
if  (_tpcheck > 200) then 
	{
	titleCut ["""", ""BLACK"",0];
	disableUserInput true;
	titleText [_banmessage, ""PLAIN""];
	broadcast00211 = 1;
	publicVariable ""broadcast"";
	mess_player00211 = ""INSLimitedAdmin: "" + _player + "" Has Been Caught Hacking, Contact An Admin Now! UID:"" + _uid;
	publicVariable ""mess_player00211"";
	player addScore -5000;
	mess_serv00211 = ""INSLimitedAdmin: "" + _player + "" Teleported UID:"" + _uid;
	publicVariableServer ""mess_serv00211"";
	broadcast_serv00211 = 1;
	publicVariableServer ""broadcast_serv00211"";
	sleep 0.2;
	mess_serv00211 = ""INSLimitedAdmin: "" + _player + "" Was Hack-Locked By INSLimitedAdmin UID:"" + _uid;
	publicVariableServer ""mess_serv00211"";
	broadcast_serv00211 = 1;
	publicVariableServer ""broadcast_serv00211"";
	_you = vehicle player;
	while {_hacklock} do
	{
		removeAllWeapons player;
		removeBackpack player;
		removeGoggles player;
		removeHeadgear player;
		removeUniform player;
		removeVest player;
		_you setPos [0,0,1000];
		sleep 0.1;
	};
	};
};
";
_l1 = "logic" createUnit [[1,1,1], (createGroup sideLogic), format ["[] spawn {%1}", _1st], 0.5, "corporal"];