/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#include "defineRscIncDesign.inc"

private [ "_mode", "_params" ];
_mode = _this select 0;
_params = _this select 1;

switch _mode do {

	case "onLoad": {

		//--- Define variables

		//--- Controls
		_display = _params select 0;

		//--- Control ListVehicles
		_ctrlListVehicles = _display displayCtrl IDC_RSCDISPLAYVEHICLESHOP_LISTVEHICLES;
		{ _lbAdd = _ctrlListVehicles lbAdd ( _x select 0 ); _ctrlListVehicles lbSetPicture [ _lbAdd, _x select 1 ]; } forEach [ [ "SUV", "\A3\soft_f_gamma\SUV_01\Data\UI\portrait_suv_01_CA.paa" ], [ "Hatchback", "\A3\soft_f_gamma\Hatchback_01\Data\UI\portrait_car_CA.paa" ] ];

		//--- Control BarStat1
		_ctrlBarStat1 = _display displayCtrl IDC_RSCDISPLAYVEHICLESHOP_BARSTAT1;
		_ctrlBarStat1 progressSetPosition 0.8;

		//--- Control BarStat2
		_ctrlBarStat2 = _display displayCtrl IDC_RSCDISPLAYVEHICLESHOP_BARSTAT2;
		_ctrlBarStat2 progressSetPosition 0.3;

		//--- Control BarStat3
		_ctrlBarStat3 = _display displayCtrl IDC_RSCDISPLAYVEHICLESHOP_BARSTAT3;
		_ctrlBarStat3 progressSetPosition 0.6;

	};

	case "onUnload": {

	};

};
