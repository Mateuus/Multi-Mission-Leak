//Jobcentre Onload.sqf

disableSerialization;

_JobConfig = "true" configClasses (missionconfigFile >> "ADT_Jobs");
_Workers = 0;
{
	_Workers = 0;
	_JobTitle = getText(_x select 0);
	_JobVar = getText(_x select 1);
	diag_log format["%1------%2",configName _x,_JobVar];
	_MaxWorkers = getNumber(_x select 2);
	_ConfigName = configName _x;
	{
		_JobVar = _JobVar;
		if(_x getVariable ["Job",""] == _JobVar)then{
			_Workers = _Workers + 1;
		};
	}count playableUnits;
	_FormatText = format["%1 (%2/%3)",_JobTitle,_Workers,_MaxWorkers];
	_index = lbAdd [9956630,_FormatText];
	lbSetData [9956630, _index, _ConfigName];
}count _JobConfig;
