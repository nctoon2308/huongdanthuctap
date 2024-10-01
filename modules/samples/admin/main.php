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
$per_page = 3;


$ajax_action = $nv_Request->get_title('action', 'post', '');
$ajax_sgt = $nv_Request->get_int('ajax_sgt', 'post', '');
$ajax_sid = $nv_Request->get_title('ajax_sid', 'post', '');

if ($ajax_action == 'update_sid') {
    $exe = $db->query('UPDATE students SET sgt= ' . $ajax_sgt .' WHERE sid = ' . $db->quote($ajax_sid));
    if ($exe) {
        nv_jsonOutput([
            'status' => 'success',
            'mess' => 'Cập nhật thành công'
        ]);
    }
}

$url_default = NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=' . $op;
$base_url = $url_default;

$page = $nv_Request->get_int('page', 'get', 1);

$num_items = $db->query("SELECT COUNT(*) FROM students")->fetchColumn();

$arr_data = [];
$_data = [];

$sql = "SELECT * FROM students ORDER BY id DESC LIMIT 3 OFFSET " . $per_page * ($page - 1);
$arr_data = $db->query($sql)->fetchAll();

$arr_gt = [
  1 => "Nam",
  2 => "Nữ"
];

$s_sid = $nv_Request->get_title('sid', 'get', '');
$delete = $nv_Request->get_int('delete', 'get', 0);
if ($s_sid != '') {
    if ($delete != 1) {
        //sửa
        $sql = "SELECT * FROM students WHERE sid = " . $db->quote($s_sid);
        $_data = $db->query($sql)->fetch();
    } else {
        //xoá
        $sql = "DELETE FROM `students` WHERE sid = " . $db->quote($s_sid);
        $_data = $db->query($sql)->fetch();
        nv_redirect_location($url_default);
    }

}

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

        $student = $db->query("SELECT * FROM students WHERE sid = " . $db->quote($sid))->fetch();
        if (!empty($student)) {
            //update
            $sth = $db->prepare('UPDATE students SET sname=:sname, sage=:sage, sgt=:sgt WHERE sid = ' . $db->quote($sid));
        } else {
            //insert
            $sth = $db->prepare("INSERT INTO `students`(`sname`, `sid`, `sage`, `sgt`) VALUES (:sname, :sid, :sage, :sgt)");
            $sth->bindParam(':sid', $sid, PDO::PARAM_STR);
        }
        $sth->bindParam(':sname', $sname, PDO::PARAM_STR);
        $sth->bindParam(':sage', $sage, PDO::PARAM_INT);
        $sth->bindParam(':sgt', $sgt, PDO::PARAM_INT);
        $exe = $sth->execute();

        if ($exe) {
            $success = 'Lưu thành công';
            nv_redirect_location($url_default);
        }
    }
}

$generate_page = nv_generate_page($base_url, $num_items, $per_page, $page);


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

if ($_data != []) {
    $sname = $_data['sname'];
    $sid = $_data['sid'];
    $sgt = $_data['sgt'];
    $sage = $_data['sage'];
}

if ($sname != '') {
    $xtpl->assign('sname', $sname);
}
if ($sage != 0) {
    $xtpl->assign('sage', $sage);
}
if ($sid != '') {
    $xtpl->assign('sid', $sid);
}

foreach ($arr_gt as $key => $gt) {

    $selected = $key == $sgt ? "selected" : "";

    $xtpl->assign('selected', $selected);
    $xtpl->assign('key', $key);
    $xtpl->assign('gt', $gt);

    $xtpl->parse('main.block_gt');
}

$stt = ($page - 1) * $per_page + 1;
if ($arr_data != []) {
    foreach ($arr_data as $data) {
        $data['stt'] = $stt;
        $stt ++;
        $data['link_edit'] = $url_default . '&sid=' . $data['sid'];
        $data['link_delete'] = $url_default . '&delete=1&sid=' . $data['sid'];

        foreach ($arr_gt as $key => $gt) {
            $selected = $key == $data['sgt'] ? "selected" : "";
            $xtpl->assign('selected', $selected);
            $xtpl->assign('key', $key);
            $xtpl->assign('gt', $gt);
            $xtpl->parse('main.arr_data.block_gt_data');
        }

        $xtpl->assign('data', $data);
        $xtpl->parse('main.arr_data');
    }
}

if (!empty($generate_page)) {
    $xtpl->assign('GENERATE_PAGE', $generate_page);
    $xtpl->parse('main.generate_page');
}


//-------------------------------
// Viết code xuất ra site vào đây
//-------------------------------

$xtpl->parse('main');
$contents = $xtpl->text('main');

include NV_ROOTDIR . '/includes/header.php';
echo nv_admin_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';
