private["_nosrandom","_nosstufe"];
closeDialog 0;
_unit = cursorTarget;

if (count (_unit getVariable ["vehicle_info_owners", []]) < 1 || !(_unit isKindOf "Car")) exitWith {hint "Du kannst hier kein NoS einbauen.";};
if (vehicle player != player) exitWith {};
if (!([false,"nitrov2",1] call DWEV_fnc_handlelnv)) exitWith {};

_nosrandom = round(random 5);
		switch (_nosrandom) do
		{
			case 0: // hat 50% weniger chance als 1 2 3 oder 4 zu kommen
			{
				_nosstufe = 13;
			};
			case 1:
			{
				_nosstufe = 3;
			};
			case 2:
			{
				_nosstufe = 5;
			};
			case 3:
			{
				_nosstufe = 7;
			};
			case 4:
			{
				_nosstufe = 9;
			};
			case 5: // hat 50% weniger chance als 1 2 3 oder 4 zu kommen
			{
				_nosstufe = 11;
			};
		};

DWEV_action_inUse = true;

_upp = "NoS V2 wird eingebaut...";
disableSerialization;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNameSpace getVariable "DWEV_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_success=false;
while{true} do
{	
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then
		{
			player action ["SwitchWeapon", player, player, 100];
			player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			player playActionNow "stop";
			player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			player playActionNow "stop";
			player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		};
		
	sleep 0.195;
	
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true; };
	if(DWEV_istazed) exitWith {}; //Tazed
	if(DWEV_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _unit > 6) exitWith {};
	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];

DWEV_action_inUse = false;

if (_success) then
{
	_unit setVariable["nitrov2",_nosstufe,true];
	format["Es wurde dir %1x NoS V2 eingebaut.",_nosstufe] remoteExec ["hint", player];
};