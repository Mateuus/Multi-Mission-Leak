mycv = cameraView;
spect = 
{
	_splr = _this select 0;
	F3_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x3D) then {spectate = false;};"];	
	(vehicle _splr) switchCamera "EXTERNAL";
	titleText ["Spectating...","PLAIN DOWN"];titleFadeOut 4;
	waitUntil { !(alive _splr) or !(alive player) or !(spectate)};
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", F3_EH];
	player switchCamera mycv;	 
};


_n2sh = 10; _n2c = "Select Player:";shnext = false; nlist = [];  selecteditem = "";

if (isNil "spectate") then {spectate = true;} else {spectate = !spectate;};
if (spectate) then 
{
		 
	{if ((_x != player) and (getPlayerUID _x != "")) then {nlist pushBack name _x;};} forEach Entities "CAManBase";
	{if ((count crew _x)>0) then {{if ((_x != player) and (getPlayerUID _x != "")) then {nlist pushBack name _x;};} forEach crew _x;};
	} foreach (Entities "LandVehicle"+ Entities "Air" + Entities"Ship");
	shnmenu = 
	{
		_pmenu = [["",true],[_n2c, [-1], "", -5, [["expression", ""]], "1", "0"]];
		for "_i" from (_this select 0) to (_this select 1) do
		{_arr = [format['%1',nlist select (_i)], [_i - (_this select 0) + 2],  "", -5, [["expression", format["selecteditem = nlist select %1;",_i]]], "1", "1"];_pmenu set [_i+2, _arr];};
		if (count nlist >  (_this select 1)) then {_pmenu set [(_this select 1)+2, ["Next", [12], "", -5, [["expression", "shnext = true;"]], "1", "1"]];}
		else {_pmenu set [(_this select 1)+2, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];};
		_pmenu set [(_this select 1)+3, ["Exit", [13], "", -5, [["expression", "selecteditem = 'exitscript';"]], "1", "1"]];
		showCommandingMenu "#USER:_pmenu";
	};
	_j = 0; _n2sh = 10; if (_n2sh>9) then {_n2sh=10;};
	while {selecteditem==""} do
	{
		[_j,(_j+_n2sh) min (count nlist)] call shnmenu;_j=_j+_n2sh;
		WaitUntil {selecteditem!="" or shnext};	
		shnext = false;
	};

	
	if (selecteditem!= "exitscript") then
	{
		_name = selecteditem;
		{if(format[name _x] == _name) then {[_x] call spect;};} forEach Entities "CAManBase";
		{if ((count crew _x)>0) then {if(format[name _x] == _name) then {[_x] call spect;};};} foreach (Entities "LandVehicle"+ Entities "Air" + Entities"Ship");
	};
	spectate = false;
	
};
if (!spectate) then 
{	
	titleText ["Back to player...","PLAIN DOWN"];titleFadeOut 4;
};