//You can add these queries to the bottom of your init.sqf, or elsewhere if you wish




//check if governor is ready to be elected
_query = "SELECT time FROM rules";
_result = [_query,2] call DB_fnc_asyncCall;
//96 hours is 4 days, edit to your own liking
if((_result select 0) >= 95) then {
	_query = "UPDATE players SET voted=0";
	[_query,1] call DB_fnc_asyncCall;
	_query = "SELECT uid FROM politics ORDER BY votecount DESC";
	_winner = (([_query,2,true] call DB_fnc_asyncCall) select 0) select 0;
	_query = format["UPDATE rules SET uid='%1', time=0",_winner];
	[_query,1] call DB_fnc_asyncCall;
	_query = "CALL deleteCandidates";
	[_query,1] call DB_fnc_asyncCall;
};

//Set up data relating to who is already running for president at server start
_query = "SELECT uid,name,invest,policy FROM politics WHERE active=1";
life_run_data = [_query,2,true] call DB_fnc_asyncCall;
publicVariable "life_run_data";


//Finally, who is the president currently?
_query = "Select uid FROM rules";
life_rules = ([_query,2] call DB_fnc_asyncCall);
publicVariable "life_rules";

//The life_rules array was also meant to host data regarding what the "laws" currently are, however that's going to be up to you.
//At the moment it's just an array with our Prez's UID inside