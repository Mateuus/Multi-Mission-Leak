    _type = _this select 0; _param = _this select 1;  _cCamera = 55002; _cTarget = 55003; _cName = 55004; KEGs_cLBCameras = 55005; KEGs_cLBTargets = 55006; _cCamerasBG = 55007; _cTargetsBG = 55008; _cBG1 = 55009; _cBG2 = 55010; _cTitle = 55011; _cHelp = 55012; _cMap = 55013; _cMapFull = 55014; _cMapFullBG = 55015; _cEventLog = 50016; _cDebug = 55100; _UI = [_cCamera, _cTarget, _cName, KEGs_cLBCameras, KEGs_cLBTargets, _cCamerasBG, _cTargetsBG, _cBG1, _cBG2, _cTitle, _cHelp];  KEGs_fnc_camMove2 =  { 	private ["_zlnthakjjzztpnuwaezditlfyhwbypgmkaloeosmcjehvzuqkpsxhhsumkdgsgborvwo","_zCoef","_ocewhjdawkgaeqymlngmaaoguhgrgpwxomycehuhdsrnkddpcchgminzbzzo","_rbofweveisxnsidbthmtxcccvqfxtbcjcsplfrdaybnczifvgakuyfemverolavpp","_pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuZ","_brhiyffuidnumilwxgiydestmqriwxnryoervxgjkmptdvwovbajhzdogoff","_pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuir","_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka"];  	if (KEGs_cameraNames select KEGs_cameraIdx == "Free") then 	{ 		_ocewhjdawkgaeqymlngmaaoguhgrgpwxomycehuhdsrnkddpcchgminzbzzo = _this select 0; 		_rbofweveisxnsidbthmtxcccvqfxtbcjcsplfrdaybnczifvgakuyfemverolavpp = _this select 1; 		_pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuZ = _this select 2; 		 		 		_zlnthakjjzztpnuwaezditlfyhwbypgmkaloeosmcjehvzuqkpsxhhsumkdgsgborvwo = 0.1; 		_zCoef = 0.1; 		if (KEGs_CTRL_PRESS && { (_pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuZ == 0) } ) then {_zlnthakjjzztpnuwaezditlfyhwbypgmkaloeosmcjehvzuqkpsxhhsumkdgsgborvwo = 5; _zCoef = 3; };  		if (KEGs_ALT_PRESS) then {_zlnthakjjzztpnuwaezditlfyhwbypgmkaloeosmcjehvzuqkpsxhhsumkdgsgborvwo = 1;  _zCoef = 0.5; };   		_brhiyffuidnumilwxgiydestmqriwxnryoervxgjkmptdvwovbajhzdogoff = getPosASL KEGscam_free; 		_pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuir = (direction KEGscam_free) + _ocewhjdawkgaeqymlngmaaoguhgrgpwxomycehuhdsrnkddpcchgminzbzzo * 90; 		_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka = [ 			(_brhiyffuidnumilwxgiydestmqriwxnryoervxgjkmptdvwovbajhzdogoff select 0) + ((sin _pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuir) * _zlnthakjjzztpnuwaezditlfyhwbypgmkaloeosmcjehvzuqkpsxhhsumkdgsgborvwo * _rbofweveisxnsidbthmtxcccvqfxtbcjcsplfrdaybnczifvgakuyfemverolavpp), 			(_brhiyffuidnumilwxgiydestmqriwxnryoervxgjkmptdvwovbajhzdogoff select 1) + ((cos _pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuir) * _zlnthakjjzztpnuwaezditlfyhwbypgmkaloeosmcjehvzuqkpsxhhsumkdgsgborvwo * _rbofweveisxnsidbthmtxcccvqfxtbcjcsplfrdaybnczifvgakuyfemverolavpp), 			(_brhiyffuidnumilwxgiydestmqriwxnryoervxgjkmptdvwovbajhzdogoff select 2) + _pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuZ * _zCoef * (abs(((getPosATL KEGscam_free) select 2) + 0.001379)/5) 		]; 		 		_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka set [2,(_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka select 2) max ((getTerrainHeightASL _pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka) + 1)]; 		KEGscam_free setPosASL _pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka; 	}; };  switch (_type) do  { 	 	case "MapClick":  	{	 		_mapClickPos = _this select 1; 		 		if (KEGs_cameraNames select KEGs_cameraIdx == "Free") then   		{ 			_xx = _mapClickPos select 0; 			_yy = _mapClickPos select 1; 			 			 						 			KEGscam_free setpos [_xx, _yy, (getPosATL KEGscam_free) select 2]; 			 			KEGS_camMarker setmarkerposlocal position KEGscam_free; 			KEGS_camMarker setmarkerdirlocal direction KEGscam_free; 				 			if(ctrlVisible _cMapFull) then  			{ 				ctrlShow[_cMapFull, false]; 				ctrlShow[_cMapFullBG, false];			 				0.5 fadeSound KEGsSoundVolume; 				ctrlShow[_cMap, true]; 			}; 		} 		else 		{ 			_newCamTarget = (nearestObjects [_mapClickPos, ["CAManBase", "Air", "Car", "Tank"], 200]) select 0; 			  			if ( !( isNull _newCamTarget ) && { ( vehicle _newCamTarget == _newCamTarget ) } ) then  			{ 				 				_newCamTarget = (crew _newCamTarget) select 0; 			}; 			 			if ( !( isNull _newCamTarget ) && { !((deathCam find _newCamTarget) == -1) } ) then 			{ 				KEGs_tgtIdx = deathCam find _newCamTarget; 				 				KEGs_target = _newCamTarget; 				 				 				  				 				 				KEGscam_free setPosATL (KEGs_target modelToWorld [0,-50,((getPosATL KEGscam_free) select 2)]); 				KEGscam_free setDir (getDir KEGs_target); 				[KEGscam_free,KEGscam_free_pitch,0] call bis_fnc_setpitchbank; 				 				KEGS_camMarker setmarkerposlocal position KEGscam_free; 				KEGS_camMarker setmarkerdirlocal direction KEGscam_free; 				 				 				[false] spawn PlayerMenuHandler;  				KEGs_autoTarget = KEGs_target;				 				 				 				if(ctrlVisible _cMapFull) then  				{ 					ctrlShow[_cMapFull, false]; 					ctrlShow[_cMapFullBG, false];			 					0.5 fadeSound KEGsSoundVolume; 					ctrlShow[_cMap, true]; 				}; 			}; 		}; 	}; 	 	case "KeyDown":  	{		 		_key = _param select 1; 		 		 		 		switch(_key) do  		{		 			case 32:  			{  				 				[1,1,0] call KEGs_fnc_camMove2; 			};	 			case 30:  			{  				 				[-1,1,0] call KEGs_fnc_camMove2; 			}; 			case 17:  			{  				 				[0,1,0] call KEGs_fnc_camMove2; 			};	 			case 31:  			{  				 				[0,-1,0] call KEGs_fnc_camMove2; 			}; 			case 16:  			{  				 				[0,0,1] call KEGs_fnc_camMove2; 			}; 			case 44:  			{  				 				[0,0,-1] call KEGs_fnc_camMove2; 			};			 			case 35:  			{  				 				if (NORRN_noMarkersUpdates) then  				{ 					NORRN_noMarkersUpdates = false; 					titleCut ["\n\n\n\n\n\n\n\n\nMap Marker Updates Enabled","PLAIN", 0.2]; 				} else { 					NORRN_noMarkersUpdates = true; 					titleCut ["\n\n\n\n\n\n\n\n\nMap Marker Updates Disabled","PLAIN", 0.2]; 				}; 			}; 			case 56:  			{  				 				KEGs_ALT_PRESS = true; 			}; 			case 29:  			{  				 				KEGs_CTRL_PRESS = true; 			}; 		}; 	};  	 	 	case "KeyUp":  	{ 		_key = _param select 1;  		switch(_key) do  		{ 			case 32: { 				 				if !(KEGs_cameraNames select KEGs_cameraIdx == "Free") then  				{ 					 					KEGs_tgtIdx = ( KEGs_tgtIdx + 1 ); 					if ( KEGs_tgtIdx > ((count deathCam) - 1 ) ) then { KEGs_tgtIdx = 0 }; 				 					KEGs_target = deathCam select KEGs_tgtIdx; 					 					 					while { ( KEGsDeadFilter ) && !( alive KEGs_target) } do 					{ 						KEGs_tgtIdx = ( KEGs_tgtIdx + 1 ); 						if ( KEGs_tgtIdx > ((count deathCam) - 1 ) ) then { KEGs_tgtIdx = 0 }; 						KEGs_target = deathCam select KEGs_tgtIdx; 						 					}; 					 					 					while { ( KEGsAIfilter ) && !( isPlayer KEGs_target) } do 					{ 						KEGs_tgtIdx = ( KEGs_tgtIdx + 1 ); 						if ( KEGs_tgtIdx > ((count deathCam) - 1 ) ) then { KEGs_tgtIdx = 0 }; 						KEGs_target = deathCam select KEGs_tgtIdx; 					};					 					 					[false] spawn PlayerMenuHandler; 					 					if((KEGs_cameras select KEGs_cameraIdx) == KEGscam_1stperson) then  					{ 						[] spawn CameraMenuHandler; 					};					  					KEGs_autoTarget = KEGs_target;					  					KEGscam_free setPosATL (KEGs_target modelToWorld [0,-50,((getPosATL KEGscam_free) select 2)]); 					KEGscam_free setDir (getDir KEGs_target); 					[KEGscam_free,KEGscam_free_pitch,0] call bis_fnc_setpitchbank;  				}; 			};	 			case 30: { 				 				if !(KEGs_cameraNames select KEGs_cameraIdx == "Free") then  				{ 					  					KEGs_tgtIdx = ( KEGs_tgtIdx - 1 ); 					if ( KEGs_tgtIdx < 0 ) then { KEGs_tgtIdx =  ((count deathCam) - 1 ) }; 					 					KEGs_target = deathCam select KEGs_tgtIdx; 					 					 					while { ( KEGsDeadFilter ) && !( alive KEGs_target) } do 					{ 						KEGs_tgtIdx = ( KEGs_tgtIdx - 1 ); 						if ( KEGs_tgtIdx < 0 ) then { KEGs_tgtIdx =  ((count deathCam) - 1 ) }; 						KEGs_target = deathCam select KEGs_tgtIdx; 					};					 					 					 					while { ( KEGsAIfilter ) && !( isPlayer KEGs_target) } do 					{ 						KEGs_tgtIdx = ( KEGs_tgtIdx + 1 ); 						if ( KEGs_tgtIdx > ((count deathCam) - 1 ) ) then { KEGs_tgtIdx = 0 }; 						KEGs_target = deathCam select KEGs_tgtIdx; 					};	 					 					[false] spawn PlayerMenuHandler; 					 					if((KEGs_cameras select KEGs_cameraIdx) == KEGscam_1stperson) then  					{ 						[] spawn CameraMenuHandler; 					}; 					 					KEGs_autoTarget = KEGs_target; 					 					KEGscam_free setPosATL (KEGs_target modelToWorld [0,-50,((getPosATL KEGscam_free) select 2)]); 					KEGscam_free setDir (getDir KEGs_target); 					[KEGscam_free,KEGscam_free_pitch,0] call bis_fnc_setpitchbank; 				}; 			}; 		 			case 46: { 				 				VM_CurrentCameraView = "";  				KEGs_cameraIdx = KEGs_cameraIdx + 1; 				KEGs_cameraIdx = KEGs_cameraIdx % (count KEGs_cameras); 				["Specta_Events"] call CameraMenuHandler; 				KEGsCamBack = false; 			};  			case 20: { 				 				KEGsTags = !KEGsTags; 				if(!KEGsTags) then  				{ 					lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleTags, [1,1,1,0.33]]; 				} 				else 				{ 					KEGSTagsScript = [] spawn KEGsShowUnitLocator; 					lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleTags, [1, 0.5, 0, 1]]; 				}; 			}; 			 			case 21: { 					 					KEGsTagsStat = !KEGsTagsStat; 					if(!KEGsTagsStat) then  					{ 						lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleTagsStat, [1,1,1,0.33]]; 					} 					else 					{ 						KEGSTagsStatScript = [] spawn KEGsShowCombatMode; 						lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleTagsStat, [1, 0.5, 0, 1]]; 					}; 			}; 			 			case 33: { 				 				KEGsAIfilter = !KEGsAIfilter; 				KEGsNeedUpdateLB = true; 			};			 			 			case 47: { 				 				if ( viewDistance >  KEGsOrgViewDistance ) then  				{  					if ( KEGs_ALT_PRESS ) then  					{ 						if ( viewDistance == KEGsTempViewDistance ) then  						{ 							setViewDistance KEGsOrgViewDistance; 						} 						else 						{ 							setViewDistance KEGsTempViewDistance; 						}; 					} 					else 					{ 						if ( KEGs_CTRL_PRESS ) then  						{ 							setViewDistance 20000; 						} 						else 						{ 							setViewDistance KEGsOrgViewDistance; 						}; 					}; 				} 				else  				{ 					if ( KEGs_ALT_PRESS ) then  					{ 						setViewDistance (( 4 * KEGsOrgViewDistance) max 9000 min 14000); 					} 					else 					{ 						setViewDistance KEGsTempViewDistance; 					}; 				}; 			}; 			 			case 57: { 				 				if(KEGs_cameras select KEGs_cameraIdx == KEGscam_1stperson) then  				{ 					KEGs1stGunner = !KEGs1stGunner; 				}; 				[] spawn CameraMenuHandler; 			}; 			 			 			case 2: { 						KEGs_cameraIdx = 0;  						VM_CurrentCameraView = "";  						 						lbSetCurSel[KEGs_cLBCameras, KEGs_cameraIdx];  						ctrlSetText[_cCamera, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]];  						["Specta_Events"] spawn CameraMenuHandler; 					};				 			 			case 3: { 						KEGs_cameraIdx = 1;  						VM_CurrentCameraView = "";  						 						lbSetCurSel[KEGs_cLBCameras, KEGs_cameraIdx];  						ctrlSetText[_cCamera, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]];	 						["Specta_Events"] spawn CameraMenuHandler; 					};				 			 			case 4: { 						KEGs_cameraIdx = 2;  						VM_CurrentCameraView = "";  						 						lbSetCurSel[KEGs_cLBCameras, KEGs_cameraIdx];  						ctrlSetText[_cCamera, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]];	 						["Specta_Events"] spawn CameraMenuHandler; 					}; 			 			case 5: { 						KEGs_cameraIdx = 3;  						VM_CurrentCameraView = "";  						 						lbSetCurSel[KEGs_cLBCameras, KEGs_cameraIdx];  						ctrlSetText[_cCamera, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]];	 						["Specta_Events"] spawn CameraMenuHandler; 					};					 		 			 			case 49: { 				if(ctrlVisible _cMapFull) then  				{ 					KEGsMarkerType = KEGsMarkerType + 1; 					if(KEGsMarkerType > 2) then {KEGsMarkerType=0;};					 				} 				else  				{ 					KEGs_camera_vision = KEGs_camera_vision + 1; 					KEGs_camera_vision = KEGs_camera_vision % 4; 					 					switch (KEGs_camera_vision) do  					{ 						case 0: { 							camusenvg false; 							false SetCamUseTi 0; 						}; 						case 1: { 							camusenvg true; 							false SetCamUseTi 0; 						}; 						case 2: { 							camusenvg false; 							true SetCamUseTi 0; 						}; 						case 3: { 							camusenvg false; 							true SetCamUseTi 1; 						}; 					}; 				}; 			}; 			 			case 50: {["ToggleMap",0] call spectate_events;}; 			case 15: {["ToggleUI",0] call spectate_events;}; 			case 59: {["ToggleHelp",0] call spectate_events;};			 			 			 			case 78: {if(KEGsMarkerSize < 1.7) then {KEGsMarkerSize = KEGsMarkerSize * 1.15}}; 			case 74: {if(KEGsMarkerSize > 0.7) then {KEGsMarkerSize = KEGsMarkerSize * (1/1.15)}}; 			 			case 56: {  				 				KEGs_ALT_PRESS = false; 			}; 			case 29: {  				 				KEGs_CTRL_PRESS = false; 			}; 		}; 	}; 	 	 	 	case "MouseMoving":  	{	 		 		 			_x = _param select 1; 			_y = _param select 2; 			KEGsMouseCoord = [_x, _y]; 			[] spawn FreeLookMovementHandler; 		 	}; 		 	case "MouseButtonDown":  	{ 		 		 			_x = _param select 2; 			_y = _param select 3; 			_button = _param select 1; 			KEGsMouseButtons set[_button, true]; 		 	}; 	 	case "MouseButtonUp":  	{ 		 		 			_x = _param select 2; 			_y = _param select 3; 			_button = _param select 1; 			KEGsMouseButtons set[_button, false]; 			[] spawn FreeLookMovementHandler; 		 	};	 	 	case "MouseZChanged":  	{	 		 	 		if !(KEGs_cameraNames select KEGs_cameraIdx == "Free") then  		{ 			 			[(_param select 1)] spawn FreeLookMovementHandler;  		} 		else 		{ 			_camVector = vectordir KEGscam_free;  			_zlnthakjjzztpnuwaezditlfyhwbypgmkaloeosmcjehvzuqkpsxhhsumkdgsgborvwo = 2; 			if (KEGs_CTRL_PRESS) then {_zlnthakjjzztpnuwaezditlfyhwbypgmkaloeosmcjehvzuqkpsxhhsumkdgsgborvwo = 50;};  			if (KEGs_ALT_PRESS) then {_zlnthakjjzztpnuwaezditlfyhwbypgmkaloeosmcjehvzuqkpsxhhsumkdgsgborvwo = 10;};  			 			_pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuZ = (( _this select 1 ) select 1 ) * _zlnthakjjzztpnuwaezditlfyhwbypgmkaloeosmcjehvzuqkpsxhhsumkdgsgborvwo; 			_vX = (_camVector select 0) * _pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuZ; 			_vY = (_camVector select 1) * _pvorcdwopqdtjgpkaqwzhfqxjcpzvexhidntldvzlyzlvlhuohvqwuhevonpfqujntqzuZ; 			_vZ = 0;   			_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka = getPosASL KEGscam_free; 			_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnokaL_z = (getPosATL KEGscam_free) select 2; 			_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka = [ 				(_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka select 0) + _vX, 				(_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka select 1) + _vY, 				(_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka select 2) + _vZ 			]; 			_pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka set [2,(getTerrainHeightASL _pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka) + _pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnokaL_z]; 			KEGscam_free setPosASL _pvzxglsrnojozowxdizfqfeuuprkxdrndlahngcgohwanifzzbuaedagnoka; 		}; 	};	  	case "MouseZChangedminimap": { 		KEGsMinimapZoom = ( KEGsMinimapZoom - ((_param select 1)*0.025) ) min 0.75 max 0.01; 		 		 	};			 		 	case "ToggleCameraMenu": { 		 		if(ctrlVisible KEGs_cLBCameras) then { 			ctrlShow[KEGs_cLBCameras, false]; 			ctrlShow[_cCamerasBG, false]; 		} else { 			ctrlShow[KEGs_cLBCameras, true]; 			ctrlShow[_cCamerasBG, true]; 		}; 	}; 	 	case "ToggleTargetMenu": { 		 		if(ctrlVisible KEGs_cLBTargets) then { 			ctrlShow[KEGs_cLBTargets, false]; 			ctrlShow[_cTargetsBG, false]; 		} else { 			ctrlShow[KEGs_cLBTargets, true]; 			ctrlShow[_cTargetsBG, true]; 		}; 	}; 	 	case "ToggleUI": { 		 		if(ctrlVisible _cName) then { 			{ctrlShow[_x, false]} foreach _UI; 		} else { 			{ctrlShow[_x, true]} foreach _UI; 			ctrlShow[_cHelp, false]; 			ctrlShow[KEGs_cLBTargets, false]; 			ctrlShow[_cTargetsBG, false];			 			ctrlShow[KEGs_cLBCameras, false]; 			ctrlShow[_cCamerasBG, false];			 		}; 	}; 		 	case "ToggleHelp": { 		 		if(ctrlVisible _cHelp) then { 			ctrlShow[_cHelp, false]; 		} else { 			ctrlShow[_cHelp, true]; 		}; 	};  	case "ToggleMap": { 		 		if(ctrlVisible _cMap and ctrlVisible _cMapFull) then { 			 			ctrlShow[_cMap, false]; 			ctrlShow[_cMapFull, false];			 			ctrlShow[_cMapFullBG, false];			 		}; 		 		if(ctrlVisible _cMap) then { 			ctrlShow[_cMap, false];			 			ctrlShow[_cMapFull, true]; 			ctrlShow[_cMapFullBG, true];			 			KEGsMarkerNames = true; 			KEGsSoundVolume = soundVolume; 			0.5 fadeSound 0.2; 		} else { 			KEGsMarkerNames = false; 			if(ctrlVisible _cMapFull) then { 				ctrlShow[_cMapFull, false]; 				ctrlShow[_cMapFullBG, false];			 				0.5 fadeSound KEGsSoundVolume; 			} else { 				ctrlShow[_cMap, true]; 			}; 		}; 	}; 	 	 	case "ToggleTags":  	{ 	 	}; 	 	 	case "ToggleTagsStat":  	{ 		if(_param select 0) then  		{ 			 			{ 				_u = _x select 0; 				_s = _x select 1; 				[_u, _s] spawn KEGsShowCombatMode; 			} foreach KEGsTagStatSources; 		} 		else  		{ 			 			{ 				_u = _x select 0;	 				_s = _x select 1;	 				if !(isNull _u) then  				{ 					_s setDropInterval 0; 				} 				else 				{ 					deleteVehicle _s; 				}; 			} foreach KEGsTagStatSources; 		};  	};	   				 	default { 		hint "Unknown event"; 	}; };  false 