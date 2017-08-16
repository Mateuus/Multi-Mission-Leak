[0,"STR_MISC_INJURE",true,[player getVariable ["realname",name player], _this select 0]] remoteExecCall ["life_fnc_broadcast",-2];
[player,profileName] remoteExecCall ["life_fnc_medicRequest",independent];
disableSerialization;
[]spawn {
		disableSerialization;
		if (isnil {uinamespace getvariable "RscHealthTextures"}) then {uinamespace setvariable ["RscHealthTextures",displaynull]};
		if (isnull (uinamespace getvariable "RscHealthTextures")) then {(["HealthPP_blood"] call bis_fnc_rscLayer) cutrsc ["RscHealthTextures","plain"]};
		_display = uinamespace getvariable "RscHealthTextures";
		_texLower = _display displayctrl 1211;
		_texLower ctrlsetfade 1;
		_texLower ctrlcommit 0;

		_texMiddle = _display displayctrl 1212;
		_texMiddle ctrlsetfade 1;	
		_texMiddle ctrlcommit 0;

		_texUpper = _display displayctrl 1213;
		_texUpper ctrlsetfade 1;	
		_texUpper ctrlcommit 0;

        _x = ((0 * safezoneW) + safezoneX) + ((safezoneW - (2.125 * safezoneW * 3/4)) / 2); 
        _y = (-0.0625 * safezoneH) + safezoneY; 
        _w = 2.125 * safezoneW * 3/4;
        _h = 1.125 * safezoneH;

       _texLower ctrlsetposition [_x, _y, _w, _h];
       _texMiddle ctrlsetposition [_x, _y, _w, _h];
       _texUpper ctrlsetposition [_x, _y, _w, _h];

       _texLower ctrlcommit 0;
       _texMiddle ctrlcommit 0;
       _texUpper ctrlcommit 0;

      _texLower ctrlsetfade 0.2;	
      _texMiddle ctrlsetfade 0.2;
      _texUpper ctrlsetfade 0.2; 

    	_texLower ctrlcommit 0.2;
      _texMiddle ctrlcommit 0.2;
      _texUpper ctrlcommit 0.2;
		};
"esg_injured" cutRsc ["esg_injured","PLAIN"];
if(vehicle player != player)then {moveOut player;};
player setUnconscious true;
[]spawn {
	while{player getVariable["esg_bewusstlos",false]} do {
		((uiNamespace getVariable "esg_injured") displayCtrl 1000) ctrlsetText format ["Verbleibende Zeit: %1",[((player getVariable ["esg_bewusstlos_delay",0]) - time),"MM:SS"] call BIS_fnc_secondsToString];
	};
};
[]spawn{
	player switchCamera "INTERNAL";
	while{player getVariable["esg_bewusstlos",false]} do {
		waitUntil{cameraView != "INTERNAL"};
		player switchCamera "INTERNAL";
	};
};
"ColorCorrections" ppEffectEnable true;
"ColorCorrections" ppEffectAdjust [1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];
"ColorCorrections" ppEffectCommit 2;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [10];
"dynamicBlur" ppEffectCommit 2;
systemchat format ["Du wurdest von %1 verwundet!",_this select 0];
waituntil{round((player getVariable ["esg_bewusstlos_delay",0]) - time) <= 0};
sleep 1;
if(!(player getVariable ["esg_bewusstlos",false]))exitWith{};
player setVariable ["esg_bewusstlos",false,true];
player setVariable ["esg_damagestore",0,true];
player setVariable ["esg_bewusstlos_delay",0,true];
player setVariable ["esg_bewusstlos_stab",0,true];
player setVariable ["esg_laststab",0,true];
player setVariable ["esg_stabinpro",false,true];
"ColorCorrections" ppEffectEnable false;
"dynamicBlur" ppEffectEnable false;
player setdamage 1;
"esg_injured" cutFadeOut 1;