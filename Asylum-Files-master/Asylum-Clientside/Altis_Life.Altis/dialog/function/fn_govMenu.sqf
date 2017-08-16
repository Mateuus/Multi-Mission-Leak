/*
	File: fn_govMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Shows governor menu
*/

private ["_display"];

disableSerialization;

_display = findDisplay 1900;
if(isNull _display) then
{
	if(!createDialog "life_governor_menu") exitWith {"Failed Creating Dialog";}; //Couldn't create the menu?
};

waitUntil {!isNull (findDisplay 1900)};

sliderSetRange [1901, 0, 20];	// Set max sales tax
sliderSetRange [1911, 0, 20];	// Set max land tax (thousands)
sliderSetRange [1921, 0, 5];	// Set max gang tax (thousands per member)

sliderSetPosition [1901, life_configuration select 3];
sliderSetPosition [1911, (life_configuration select 5) / 1000];
sliderSetPosition [1921, (life_configuration select 6) / 1000];
sliderSetPosition [1904, life_configuration select 7];

ctrlSetText[1902,format["%1%2",round(life_configuration select 3),"%"]];
ctrlSetText[1912,format["$%1k/day",round(life_configuration select 5) / 1000]];
ctrlSetText[1922,format["$%1k/d/m",round(life_configuration select 6) / 1000]];
ctrlSetText[1905,format["%1%2",round(life_configuration select 7),"%"]];

if (life_configuration select 2) then
{
	((findDisplay 1900) displayCtrl 1926) ctrlSetTextColor [0,1,0,1];
	((findDisplay 1900) displayCtrl 1926) ctrlSetText "Marijuana LEGAL";
}
else
{
	((findDisplay 1900) displayCtrl 1926) ctrlSetTextColor [1,0,0,1];
	((findDisplay 1900) displayCtrl 1926) ctrlSetText "Marijuana ILLEGAL";
};

if (!(life_configuration select 9)) then
{
	((findDisplay 1900) displayCtrl 1928) ctrlSetTextColor [0,1,0,1];
	((findDisplay 1900) displayCtrl 1928) ctrlSetText "No Death Penalty";
}
else
{
	((findDisplay 1900) displayCtrl 1928) ctrlSetTextColor [1,0,0,1];
	((findDisplay 1900) displayCtrl 1928) ctrlSetText "DEATH PENALTY";
};