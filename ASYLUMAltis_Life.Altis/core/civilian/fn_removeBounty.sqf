/*
	File: fn_removeBounty.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Event: player has been removed from wanted list.
*/
private["_uid","_owner","_unit"];
if(isServer && !hasInterface) exitWith {};
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "" || isNil "life_bounty_contract") exitWith {};

if (count life_bounty_contract > 0) then
{
	if (_uid in life_bounty_uid) then
	{
		_i = -1;
		{
			if ((_x select 1) == _uid) then { _i = _forEachIndex; };
		} forEach life_bounty_contract;
		if (_i > -1) then
		{	
			_bounty = life_bounty_contract select _i;
			["BountyUpdate",[format["Your bounty target, %1, is no longer available. Request a new bounty task.", _bounty select 0]]] call BIS_fnc_showNotification;
			life_bounty_contract set [_i, 0];
			life_bounty_contract = life_bounty_contract - [0];
			
			// Update marker IDs on map if > removed index
			for "_o" from 0 to 5 do { deleteMarkerLocal format["bounty_%1", _o]; deleteMarkerLocal format["bounty_dot_%1", _o]; };
			for "_o" from 0 to (count life_bounty_contract)-1 do
			{
				_bount = life_bounty_contract select _o;
				_oldPos = _bount select 5;
				
				if (_oldPos select 0 != 0) then
				{				
					_marker = createMarkerLocal [format["bounty_%1", _o], _oldPos];
					_marker setMarkerShapeLocal "ELLIPSE";
					_marker setMarkerSizeLocal [life_track_radius, life_track_radius];
					_marker setMarkerTypeLocal "mil_dot";
					_marker setMarkerBrushLocal "DiagGrid";
					_marker setMarkerColorLocal "ColorRed";
					_marker setMarkerTextLocal format["Fugitive %1", _bount select 0];

					_marker2 = createMarkerLocal [format["bounty_dot_%1", _o], _oldPos];
					_marker2 setMarkerShapeLocal "ICON";
					_marker2 setMarkerTypeLocal "mil_dot";
					_marker2 setMarkerColorLocal "ColorRed";
					_marker2 setMarkerTextLocal format["Fugitive %1", _bount select 0];
				};
			};
		};
		life_bounty_uid = life_bounty_uid - [_uid];
		player setVariable["myBounties",life_bounty_uid,true];
	};
};
[] call life_fnc_hudUpdate;

if (count life_bounty_uid == 0) then
{
	player setVariable ["activeBounty", nil, true];
};