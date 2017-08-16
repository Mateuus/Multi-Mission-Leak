
private ["_hostage"];
_hostage = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (player getVariable ["Undercover", false]) then {
	// Player is already undercover. Remove Cover
	player setVariable ["Undercover",false,true];
	//player setVariable ["realname",profilename,true];

	"progressBar" cutText ["","PLAIN"];
	titleText[ "You are no longer undercover","PLAIN"];
} else {
	// Player is not undercover. Go undercover
	player setVariable ["Undercover",true,true];
	player setVariable ["realname",[] call life_fnc_RandomNameGenerator,true];

	"progressBar" cutText ["","PLAIN"];
	titleText["You have gone undercover","PLAIN"];
};
