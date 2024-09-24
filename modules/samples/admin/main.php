<?php

/**
 * @Project    NUKEVIET 4.x
 * @Author     VINADES.,JSC <contact@vinades.vn>
 * @Copyright (C) 2020 VINADES.,JSC. All rights reserved
 * @License    : Not free read more http://nukeviet.vn/vi/store/modules/nvtools/
 * @Createdate Sat, 31 Oct 2020 02:20:33 GMT
 */

if (!defined('NV_IS_FILE_ADMIN')) {
    die('Stop!!!');
}

$page_title = $lang_module['main'];

//------------------------------
// Viết code xử lý chung vào đây
//------------------------------


$arr_data = [];
$sql = "SELECT * FROM students";
$arr_data = $db->query($sql)->fetchAll();

$arr_gt = [
  1 => "Nam",
  2 => "Nữ"
];

$sname = $nv_Request->get_title('sname', 'post', '');
$sid = $nv_Request->get_title('sid', 'post', '');
$sage = $nv_Request->get_int('sage', 'post', 0);
$sgt = $nv_Request->get_int('sgt', 'post', 0);

$error = '';
$success = '';

if ($nv_Request->isset_request('submit', 'post')) {
    if ($sname == '') {
        $error = 'Lỗi: Chưa nhập tên';
    } elseif ($sid == '') {
        $error = 'Lỗi: Chưa nhập mã sinh viên';
    } elseif ($sage == '') {
        $error = 'Lỗi: Chưa nhập tuổi';
    } elseif ($sgt == '') {
        $error = 'Lỗi: Chưa nhập giới tính';
    }
    if ($error == '') {
        $sth = $db->prepare("INSERT INTO `students`(`sname`, `sid`, `sage`, `sgt`) VALUES (:sname, :sid, :sage, :sgt)");

        $sth->bindParam(':sname', $sname, PDO::PARAM_STR);
        $sth->bindParam(':sid', $sid, PDO::PARAM_STR);
        $sth->bindParam(':sage', $sage, PDO::PARAM_INT);
        $sth->bindParam(':sgt', $sgt, PDO::PARAM_INT);

        $exe = $sth->execute();

        if ($exe) {
            $success = 'Lưu thành công';
        }
    }
}


$xtpl = new XTemplate('main.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);

$xtpl->assign('LANG', $lang_module);
$xtpl->assign('NV_LANG_VARIABLE', NV_LANG_VARIABLE);
$xtpl->assign('NV_LANG_DATA', NV_LANG_DATA);
$xtpl->assign('NV_BASE_ADMINURL', NV_BASE_ADMINURL);
$xtpl->assign('NV_NAME_VARIABLE', NV_NAME_VARIABLE);
$xtpl->assign('NV_OP_VARIABLE', NV_OP_VARIABLE);
$xtpl->assign('MODULE_NAME', $module_name);
$xtpl->assign('OP', $op);

if ($error != '') {
    $xtpl->assign('ERROR', $error);
}
if ($success != '') {
    $xtpl->assign('success', $success);
}

if ($sname != '') {
    $xtpl->assign('sname', $sname);
}

foreach ($arr_gt as $key => $gt) {

    $selected = $key == $sgt ? "selected" : "";

    $xtpl->assign('selected', $selected);
    $xtpl->assign('key', $key);
    $xtpl->assign('gt', $gt);

    $xtpl->parse('main.block_gt');
}
$stt = 1;
if ($arr_data != []) {
    foreach ($arr_data as $data) {
        $data['stt'] = $stt;
        $stt ++;
        $data['sgt'] = $arr_gt[$data['sgt']];
        $xtpl->assign('data', $data);
        $xtpl->parse('main.arr_data');
    }
}



//-------------------------------
// Viết code xuất ra site vào đây
//-------------------------------

$xtpl->parse('main');
$contents = $xtpl->text('main');

include NV_ROOTDIR . '/includes/header.php';
echo nv_admin_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';
