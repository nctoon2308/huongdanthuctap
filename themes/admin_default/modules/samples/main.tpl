<!-- BEGIN: main -->
{ERROR}
{success}
<form action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
    <table class="table table-striped table-bordered table-hover">
        <tbody>
        <tr>
            <td class="text-right"><strong>Họ tên: </strong></td>
            <td><input class="form-control w500" name="sname" id="sname" type="text" value="{sname}" maxlength="255"></td>
        </tr>
        <tr>
            <td class="text-right"><strong>Mã sinh viên: </strong></td>
            <td><input class="form-control w500" name="sid" id="sid" type="text" value="" maxlength="255"></td>
        </tr>
        <tr>
            <td class="text-right"><strong>Tuổi: </strong></td>
            <td><input class="form-control w500" name="sage" id="sage" type="number" value="" max="100" min="10"></td>
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
    <div class="text-center"><input class="btn btn-primary" name="submit" type="submit" value="Lưu thay đổi" /></div>
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
        </tr>
        <!-- BEGIN: arr_data -->
        <tr>
            <td>{data.stt}</td>
            <td>{data.sname}</td>
            <td>{data.sid}</td>
            <td>{data.sage}</td>
            <td>{data.sgt}</td>
        </tr>
        <!-- END: arr_data -->
        </tbody>
    </table>
</div>
<!-- END: main -->
