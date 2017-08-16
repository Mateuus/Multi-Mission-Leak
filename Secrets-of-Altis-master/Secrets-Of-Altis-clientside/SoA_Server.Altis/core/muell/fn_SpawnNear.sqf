/*#######################################################
#	Wenn man einsteigt mit einer Mülltonneejecten 		#
#	wenn man die Tonne nicht auf das Vehicle geladen 	#
#	hat.												#
#														#
#	Author: [MdF] Feindflug								#
#######################################################*/

player setVariable["muellCMAX",0,false];
player setVariable["MuellMarker",0,false];
player setVariable["MuellMarkSet",[],false];
while {true} do
{
	waitUntil {sleep 0.3; !isnull objectParent player};
	if((count attachedObjects player) > 0) then 
	{
		//_vehNear = nearestObjects [player, ["Car","Air","Ship"], 7];
		if(!isNull objectparent player) then 
		{
			player action ["GetOut",vehicle player];
			hint "Mit einem Gegenstand in der Hand kannst du nicht losfahren.";
		};
	};
	waitUntil {sleep 0.3; isNull objectParent player};
};