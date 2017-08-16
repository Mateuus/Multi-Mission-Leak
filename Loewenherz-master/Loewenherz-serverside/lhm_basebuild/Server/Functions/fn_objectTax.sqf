/* 
 Filename: fn_objectTax.sqf 
 
 Description: payment system for the gang hideouts... 
 
 Author: Blackd0g 
*/ 
private ["_buildingTax","_queryResult","_gang","_gangID","_gangBank","_gangBuildingCount","_calcBuildingTax","_query","_gangOwner"]; 
_buildingTax = param [0,1000,[1000]]; 
diag_log format ["running Building Tax Script... Current Object TAX is: %1$",_buildingTax]; 
 
// check all gangs... 
_queryResult = [" 
 SELECT 
  id, 
  bank, 
  COUNT(b.gangarea_id) AS building_count, 
  owner 
  FROM gangs AS G 
  INNER JOIN lhm_basebuild AS B 
  WHERE g.id = b.Gangarea_id AND Gangarea_id 
  GROUP BY id; 
  ",2,true] call DB_fnc_asyncCall; 
 
waitUntil {sleep 1; !isNil "_queryResult"}; 
if(count _queryResult isEqualTo 0) exitWith {diag_log "TAX Script exit with no Buildings!"}; 
 
{ 
 _gang = _x; 
 _gangID = _gang select 0; 
 _gangBank = _gang select 1; 
 _gangBuildingCount = _gang select 2; 
 _gangOwner = _gang select 3; 
 
 _calcBuildingTax = _gangBuildingCount * _buildingTax; 
 
 if (_gangBank >= _calcBuildingTax) then 
 { 
  // gang has enough money 
  _gangBank = _gangBank - _calcBuildingTax; 
  _query = format["UPDATE gangs SET Bank='%1' WHERE id='%2'",_gangBank,_gangID]; 
  [_query,1] call DB_fnc_asyncCall; 
 
  diag_log format ["LHM_BASEBUILD: Gang ID %1 paid %2 $ TAX for %3 Building(s)",_gangID,_calcBuildingTax,_gangBuildingCount]; 
 
 } else { 
  // gang has not enough money 
  // Check for Gang  Shop Flag 
  if (_gangBuildingCount > 1) then 
  { 
    _query = format["DELETE FROM lhm_basebuild WHERE lhm_basebuild.Gangarea_id = '%1' AND Classname NOT LIKE 'Flag_Quontrol_F' ORDER BY RAND() LIMIT 1",_gangID]; 
    diag_log format ["LHM_BASEBUILD: Gang ID %1 has not enough Money on their Gang-Account removing a Building!",_gangID]; 
  } else { 
   // last building is Gang Flag... 
    _query = format["DELETE FROM lhm_basebuild WHERE lhm_basebuild.Gangarea_id = '%1' ORDER BY RAND() LIMIT 1",_gangID]; 
    diag_log format ["LHM_BASEBUILD: Gang ID %1 has lost all Buildings...Hideout is gone!",_gangID]; 
  }; 
  [_query,1] call DB_fnc_asyncCall; 
 
  // Inform gangleader 
  _fromName = "Finanzverwaltung"; 
  _msg = "Sehr geehrter Bürger - Aufgrund der Zahlungsunfähigkeit ihrerseits wurde das Gericht damit beauftragt eines ihrer Gebäude zu beschlagnahmen und mit sofortiger Wirkung zu entfernen! Stellen Sie in Zukunft sicher das Ihr Gang-Konto gedeckt ist. Mit freundlichen Grüßen - Ihre Finanzverwaltung Löwenherz. Dieses Schreiben wurde maschinell erstellt und ist ohne Unterschrift gültig. Keine Antwort auf diese Nachricht möglich!"; 
  _toName = "Gang Eigentümer"; 
  [_gangOwner,_msg,_fromName,_toName] call lhm_fnc_handleServerMessages; 
 }; 
} forEach _queryResult; 
 
diag_log "generating Building Tax complete";