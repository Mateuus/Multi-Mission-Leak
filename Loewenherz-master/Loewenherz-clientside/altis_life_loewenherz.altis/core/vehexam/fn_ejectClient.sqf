_examiner_pos = _this select 0;
_exam_veh = _this select 1;

_exam_veh setVelocity [0,0,0];
player setPos _examiner_pos;
deleteVehicle _exam_veh;
