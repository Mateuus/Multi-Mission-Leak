/*
	Autor: Basti
	File: fn_fmsMain.sqf
	
	This File was written for Eastside-Gaming.de you are not allowed to use this file!
*/
createDialog "fms_system";
disableSerialization;
_display = findDisplay 39400;
_tree = _display displayCtrl 1500;
_array = [
  [[],"Leitstelle","leit"],
  [[],"Kavala","space"],
  [[],"Athira","space"],
  [[],"Sofia","space"],
  [[],"Pyrgos","space"],
  [[],"Autobahn","space"],
  [[],"Luftüberwachung","space"],
  [[],"Sondereinsatz","space"],
  [[1],"Kavala 1","kav1"],
  [[1],"Kavala 2","kav2"],
  [[2],"Athira 1","ath1"],
  [[2],"Athira 2","ath2"],
  [[3],"Sofia 1","sof1"],
  [[3],"Sofia 2","sof2"],
  [[4],"Pyrgos 1","pyr1"],
  [[4],"Pyrgos 2","pyr2"],
  [[6],"Luftüberwachung 1","lu1"],
  [[6],"Luftüberwachung 2","lu2"],
  [[7],"Bankraub [Einsatzleitung]","bankleit"],
  [[7],"Geiselnahme [Einsatzleitung]","geiselleit"],
  [[],"Nicht eingeloggt","not"],
  [[7,0],"Alpha","bankalpha"],
  [[7,0],"Bravo","bankbravo"],
  [[7,0],"Charlie","bankcharlie"],
  [[7,1],"Alpha","geiselalpha"],
  [[7,1],"Bravo","geiselbravo"],
  [[7,1],"Charlie","geiselcharlie"],
  [[5],"Autobahn 1","at1"],
  [[5],"Autobahn 2","at2"]
];
tvClear _tree;
{
  _index = _tree tvAdd [(_x select 0),(_x select 1)];
  _temp = (_x select 0);
  _temp pushback _index;
  _tree tvSetData [_temp,(_x select 2)];
}foreach _array;
tvExpandAll _tree;
_tree tvSetCurSel [0];