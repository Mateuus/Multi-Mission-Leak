/*
	File: fn_bountyReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
private["_val","_total","_Tax"];
_val = param [0,"",["",0]];
_total = param [1,"",["",0]];
_Tax = ((100 - CopTaxValue) / 100);

if (_val == _total) then
{
	if (_val > 2100001) then
	{
		_val = 2100000;
		titleText[format["Das maximale Bußgeld wurde überschritten. du hast daher nur %1€ bekommen.",[(_val * _Tax)] call DWEV_fnc_numberText],"PLAIN"];
		dwf_cash = dwf_cash + (_val * _Tax);
		[player,(_val * (1 - _Tax)),"Inhaftierung"] remoteExec ["DWF_fnc_addToStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		
	}
	else
	{
		titleText[format["Einsperren: Du hast ein Bußgeld in höhe von %1€ für die Inhaftierung eines Kriminellen erhalten.",[(_val * _Tax)] call DWEV_fnc_numberText],"PLAIN"];
		dwf_cash = dwf_cash + (_val * _Tax);
		[player,(_val * (1 - _Tax)),"Inhaftierung"] remoteExec ["DWF_fnc_addToStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		
	};
}
	else
{
	if (_val > 2100001) then
	{
		titleText[format["Tötung: Hättest du ihn Festgenommen, hättest du %1€ bekommen.",[(_total * _Tax)] call DWEV_fnc_numberText],"PLAIN"]; //muss gelöscht werden, wenn unterteil wieder aktiv
		//=========Auskommentie=========
/*		
		_val = 2100000;
		titleText[format["Tötung: Das maximale Bußgeld wurde überschritten. du hast daher nur %1€ bekommen.",[(_val * _Tax)] call DWEV_fnc_numberText],"PLAIN"];
		dwf_cash = dwf_cash + (_val * _Tax);
		[player,(_val * (1 - _Tax)),"Tötung"] remoteExec ["DWF_fnc_addToStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
*/
	}
	else
	{
		titleText[format["Tötung: Hättest du ihn Festgenommen, hättest du %1€ bekommen.",[(_total * _Tax)] call DWEV_fnc_numberText],"PLAIN"]; //muss gelöscht werden, wenn unterteil wieder aktiv
//		titleText[format["Du hast ein Bußgeld in höhe von %1€ für die Tötung eines gesuchten Kriminellen erhalten, für die Inhaftierung hättest du %2€ erhalten.",[(_val * _Tax)] call DWEV_fnc_numberText,[_total] call DWEV_fnc_numberText],"PLAIN"];
//		dwf_cash = dwf_cash + (_val * _Tax);
//		[player,(_val * (1 - _Tax)),"Tötung"] remoteExec ["DWF_fnc_addToStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
};
