#include "..\..\..\script_macros.hpp"
private ["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_opfer = param [0,objNull,[objNull]];
hint format ["%1 hat dich wiederbelebt!", _opfer getVariable ["realname",name _opfer]];
player setUnconscious false;
player setdamage 0.1;
[player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["life_fnc_animSync",-2];
player setVariable ["esg_bewusstlos",false,true];
player setVariable ["esg_damagestore",0,true];
player setVariable ["esg_bewusstlos_delay",0,true];
player setVariable ["esg_bewusstlos_stab",0,true];
player setVariable ["esg_stabinpro",false,true];
player setVariable ["esg_laststab",0,true];
"ColorCorrections" ppEffectEnable false;
"dynamicBlur" ppEffectEnable false;
"esg_injured" cutFadeOut 1;
[]spawn {
	disableSerialization;
	_displayhealth = uinamespace getvariable "RscHealthTextures"; 
	_texLower = _displayhealth displayctrl 1211; 
	_texLower ctrlsetfade 1; 
	_texLower ctrlcommit 0; 
	 
	_texMiddle = _displayhealth displayctrl 1212; 
	_texMiddle ctrlsetfade 1;  
	_texMiddle ctrlcommit 0; 
	 
	_texUpper = _displayhealth displayctrl 1213; 
	_texUpper ctrlsetfade 1;  
	_texUpper ctrlcommit 0;
};
["survive",1]call ESG_fnc_skilladd;