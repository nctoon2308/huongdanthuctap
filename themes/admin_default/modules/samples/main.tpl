<!-- BEGIN: main -->
{ERROR}
{success}
<form action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
    <table class="table table-striped table-bordered table-hover">
        <tbody>
        <tr>
            <td class="text-right"><strong>Họ tên: </strong></td>
            <td><input class="form-control w500" name="sname" id="sname" type="text" value="{sname}" maxlength="255">
            </td>
        </tr>
        <tr>
            <td class="text-right"><strong>Mã sinh viên: </strong></td>
            <td><input class="form-control w500" name="sid" id="sid" type="text" value="{sid}" maxlength="255"></td>
        </tr>
        <tr>
            <td class="text-right"><strong>Tuổi: </strong></td>
            <td><input class="form-control w500" name="sage" id="sage" type="number" value="{sage}" max="100" min="10">
            </td>
        </tr>
        <tr>
            <td class="text-right"><strong>Giới tính: </strong></td>
            <td>
                <select name="sgt" id="sgt">
                    <!-- BEGIN: block_gt -->
                    <option value="{key}" {selected}>{gt}</option>
                    <!-- END: block_gt -->
                </select>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="text-center"><input class="btn btn-primary" name="submit" type="submit" value="Lưu thay đổi"/></div>
</form>
<br>
<br>
<br>
<div class="table-responsive">
    <table class="table table-striped table-bordered table-hover" style="padding: 0px;">
        <tr>
            <th>STT</th>
            <th>Họ tên</th>
            <th>Mã sinh viên</th>
            <th>Tuổi</th>
            <th>Giới tính</th>
            <th>Chức năng</th>
        </tr>
        <!-- BEGIN: arr_data -->
        <tr>
            <td>{data.stt}</td>
            <td>{data.sname}</td>
            <td>{data.sid}</td>
            <td>{data.sage}</td>
            <td>
                <select class="sgt" name="sgt" id="sgt_{data.sid}" data_id="{data.sid}">
                    <!-- BEGIN: block_gt_data -->
                    <option value="{key}" {selected}>{gt}</option>
                    <!-- END: block_gt_data -->
                </select>
            </td>
            <td>
                <i class="fa fa-edit"></i><a href="{data.link_edit}">Sửa</a>
                <i class="fa fa-trash"></i><a href="{data.link_delete}">Xoá</a>
            </td>
        </tr>
        <!-- END: arr_data -->
        </tbody>
    </table>
    <!-- BEGIN: generate_page -->
    <div class="text-center">
        {GENERATE_PAGE}
    </div>
    <!-- END: generate_page -->
</div>
<script>
    $('.sgt').on('change', function(event) {

        var sid = $(this).attr('data_id');
        var sgt = $("#sgt_" + sid).val();
        data = {
            'action': 'update_sid',
            'ajax_sgt': sgt,
            'ajax_sid': sid
        }
        $.ajax({
            type: "POST",
            url: "",
            cache: !1,
            data: data,
            success: function (res) {
                if (res.status == 'success') {
                    alert(res.mess)
                }
            }
        })
    });
</script>
<!-- END: main -->
