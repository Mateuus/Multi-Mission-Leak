/*
	Changes state of stations.
*/
private["_shop","_robber","_action","_state"];
_shop = param [0,ObjNull,[ObjNull]];
_robber = param [1,ObjNull,[ObjNull]]; 
_action = param [2];
_state = param [3,-1,[0]];
if(isNull _shop) exitWith {};

switch (_state) do
{
	case -1: //start of robbery, we make him stand with hands up and remove the action to rob station.
	{
		_shop removeAction _action;
//		_shop switchMove "AmovPercMstpSsurWnonDnon";
	};
	case 0: //we add the action to rob and we make him lower his hands.
	{
	_action = _shop addAction["<t color='#FF0000'>Tanstelle ausrauben</t>",DWEV_fnc_robShops];
	_shop switchMove "";
	};
};