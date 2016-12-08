/*  Updates item picture
*
*/

#include "..\..\dialog\defines.hpp"
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
if (isNull _dialog) exitWith {};

_listCtrl = _dialog displayCtrl grad_lbm_ITEMLIST;
_pictureCtrl = _dialog displayCtrl grad_lbm_PICTURE;
_modelCtrl = _dialog displayCtrl grad_lbm_3DMODEL;

_selIndex = lbCursel _listCtrl;

(call compile (_listCtrl lbData _selIndex)) params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", "_displayName", "_price", "_description", "_code", "_picturePath"];

_isVehicle = [_itemConfigName] call grad_lbm_fnc_isVehicle;

//3D model
if (_isVehicle) then {
    _modelPath = getText (configfile >> "CfgVehicles" >> _itemConfigName >> "model");
    _modelSize = [GRAD_LBM_VEHICLESIZES, _itemConfigName] call CBA_fnc_hashGet;
    _modelScale = 1/_modelSize * 0.45;

    _modelCtrl ctrlSetModel _modelPath;
    _modelCtrl ctrlSetModelScale _modelScale;

    _modelCtrl ctrlCommit 0;
    _pictureCtrl ctrlShow false;
    _modelCtrl ctrlShow true;


//picture
} else {
    if (_picturePath == "") then {
        _picturePath = [_itemConfigName] call grad_lbm_fnc_getPicturePath;
    };
    if (_picturePath == "") then {
        _picturePath = (missionNamespace getVariable ["grad_lbm_moduleRoot", [] call grad_lbm_fnc_getModuleRoot]) + "\data\questionmark.paa";
    };
    _pictureCtrl ctrlSetText _picturePath;

    _modelCtrl ctrlShow false;
    _pictureCtrl ctrlShow true;
};
