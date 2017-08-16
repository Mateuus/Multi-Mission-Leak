_myzone= _this;
_playerInZone=false;
missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
sleep 30;
_playerInZone= missionNamespace getVariable [format ["%1_playerInZone", _myzone],[]];
if(!_playerInZone)then
{
	_deleteInfected=true;
	missionNamespace setVariable [format ["%1_deleteInfected", _myzone], _deleteInfected];
};
