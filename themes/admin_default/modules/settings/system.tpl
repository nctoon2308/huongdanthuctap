<!-- BEGIN: main -->
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css">
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>

<!-- BEGIN: error -->
<div class="alert alert-danger">
    {ERROR}
</div>
<!-- END: error -->
<form action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <col class="w400" />
            <tbody>
                <!-- BEGIN: closed_site -->
                <tr>
                    <td><strong>{LANG.closed_site}</strong></td>
                    <td><select name="closed_site" class="form-control w300" onchange="reopeningTimeShow(this);">
                            <!-- BEGIN: closed_site_mode -->
                            <option value="{MODE_VALUE}"{MODE_SELECTED}>{MODE_NAME}</option>
                            <!-- END: closed_site_mode -->
                        </select>
                        <div id="reopening_time" style="margin-top:10px;<!-- BEGIN: reopening_time -->display:none<!-- END: reopening_time -->">
                            <label class="control-label">{LANG.closed_site_reopening_time}</label>
                            <div class="form-inline">
                                <input class="form-control" name="reopening_date" id="reopening_date" value="{DATA.reopening_date}" style="width: 90px;" maxlength="10" type="text" />
                                <select class="form-control" name="reopening_hour">
                                    <!-- BEGIN: reopening_hour -->
                                    <option value="{RHOUR.num}"{RHOUR.sel}>{RHOUR.title}</option>
                                    <!-- END: reopening_hour -->
                                </select> : <select class="form-control" name="reopening_min">
                                    <!-- BEGIN: reopening_min -->
                                    <option value="{RMIN.num}"{RMIN.sel}>{RMIN.title}</option>
                                    <!-- END: reopening_min -->
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <!-- END: closed_site -->
                <tr>
                    <td><strong>{LANG.site_email}</strong></td>
                    <td><input type="email" name="site_email" value="{DATA.site_email}" class="form-control" style="width: 450px"/></td>
                </tr>
                <tr>
                    <td><strong>{LANG.site_phone}</strong></td>
                    <td><input type="text" name="site_phone" value="{DATA.site_phone}" class="form-control" style="width: 450px"/></td>
                </tr>
                <tr>
                    <td><strong>{LANG.themeadmin}</strong></td>
                    <td>
                    <select name="admin_theme" class="form-control w300" >
                        <!-- BEGIN: admin_theme -->
                        <option value="{THEME_NAME}"{THEME_SELECTED}>{THEME_NAME}</option>
                        <!-- END: admin_theme -->
                    </select></td>
                </tr>
                <tr>
                    <td><strong>{LANG.date_pattern}</strong></td>
                    <td><input type="text" name="date_pattern" value="{DATA.date_pattern}" class="w150 form-control"/></td>
                </tr>
                <tr>
                    <td><strong>{LANG.time_pattern}</strong></td>
                    <td><input type="text" name="time_pattern" value="{DATA.time_pattern}" class="w150 form-control"/></td>
                </tr>
                <tr>
                    <td><strong>{LANG.ssl_https}</strong></td>
                    <td>
                        <select id="ssl_https" name="ssl_https" class="form-control w300" data-val="{DATA.ssl_https}">
                            <!-- BEGIN: ssl_https -->
                            <option value="{SSL_HTTPS.key}"{SSL_HTTPS.selected}>{SSL_HTTPS.title}</option>
                            <!-- END: ssl_https -->
                        </select>
                    </td>
                </tr>
                <!-- BEGIN: system -->
                <tr>
                    <td><strong>{LANG.lang_multi}</strong></td>
                    <td><input type="checkbox" value="1" name="lang_multi" {CHECKED_LANG_MULTI} data-toggle="controlrw"/></td>
                </tr>
                <!-- BEGIN: lang_multi -->
                <tr>
                    <td><strong>{LANG.site_lang}</strong></td>
                    <td>
                    <select name="site_lang" class="form-control w300">
                        <!-- BEGIN: site_lang_option -->
                        <option value="{LANGOP}" {SELECTED}>{LANGVALUE} </option>
                        <!-- END: site_lang_option -->
                    </select></td>
                </tr>
                <!-- BEGIN: lang_geo -->
                <tr>
                    <td><strong>{LANG.lang_geo}</strong></td>
                    <td><input type="checkbox" value="1" name="lang_geo" {CHECKED_LANG_GEO} /> ( <a href="{CONFIG_LANG_GEO}">{LANG.lang_geo_config}</a> ) </td>
                </tr>
                <!-- END: lang_geo -->
                <!-- END: lang_multi -->
                <tr>
                    <td><strong>{LANG.rewrite}</strong></td>
                    <td><input type="checkbox" value="1" name="rewrite_enable" {CHECKED_REWRITE_ENABLE} data-toggle="controlrw"/></td>
                </tr>
                <tr id="tr_rewrite_optional"{SHOW_REWRITE_OPTIONAL}>
                    <td><strong>{LANG.rewrite_optional}</strong></td>
                    <td><input type="checkbox" value="1" name="rewrite_optional" {CHECKED_REWRITE_OPTIONAL} data-toggle="controlrw1"/></td>
                </tr>
                <tr id="tr_rewrite_op_mod"{SHOW_REWRITE_OP_MOD}>
                    <td><strong>{LANG.rewrite_op_mod}</strong></td>
                    <td>
                    <select name="rewrite_op_mod" class="form-control w300">
                        <option value="">&nbsp;</option>
                        <!-- BEGIN: rewrite_op_mod -->
                        <option value="{MODE_VALUE}"{MODE_SELECTED}>{MODE_NAME}</option>
                        <!-- END: rewrite_op_mod -->
                    </select></td>
                </tr>
                <tr>
                    <td><strong>{LANG.site_timezone}</strong></td>
                    <td>
                    <select name="site_timezone" id="site_timezone" class="form-control w300">
                        <option value="">{LANG.timezoneAuto}</option>
                        <!-- BEGIN: opsite_timezone -->
                        <option value="{TIMEZONEOP}" {TIMEZONESELECTED}>{TIMEZONELANGVALUE} </option>
                        <!-- END: opsite_timezone -->
                    </select>
                    {CURRENT_TIME}
                    </td>
                </tr>
                <tr>
                    <td><strong>{LANG.gzip_method}</strong></td>
                    <td><input type="checkbox" value="1" name="gzip_method" {CHECKED_GZIP_METHOD} /></td>
                </tr>
                <tr>
                    <td><strong>{LANG.my_domains}</strong></td>
                    <td><input type="text" name="my_domains" value="{MY_DOMAINS}" class="form-control" style="width: 450px"/></td>
                </tr>
                <tr>
                    <td><strong>{LANG.static_url}</strong></td>
                    <td><input type="text" name="nv_static_url" value="{DATA.nv_static_url}" class="form-control pull-left" style="width: 450px"/></td>
                </tr>
                <tr>
                    <td><strong>{LANG.cdn_url}</strong></td>
                    <td><input type="text" name="cdn_url" value="{DATA.cdn_url}" class="form-control pull-left" style="width: 450px"/></td>
                </tr>
                <tr>
                    <td><strong>{LANG.error_set_logs}</strong></td>
                    <td><input type="checkbox" value="1" name="error_set_logs" {CHECKED_ERROR_SET_LOGS} /></td>
                </tr>
                <tr>
                    <td><strong>{LANG.nv_debug}</strong></td>
                    <td><label><input type="checkbox" name="nv_debug" value="1"{CFG_DEFINE.nv_debug}/> {LANG.nv_debug_help}</label></td>
                </tr>
                <tr>
                    <td><strong>{LANG.remote_api_access}</strong></td>
                    <td><label><input type="checkbox" name="remote_api_access" value="1"{CHECKED_REMOTE_API_ACCESS}/> {LANG.remote_api_access_help}</label></td>
                </tr>
                <tr>
                    <td><strong>{LANG.remote_api_log}</strong></td>
                    <td><input type="checkbox" name="remote_api_log" value="1"{CHECKED_REMOTE_API_LOG}/></td>
                </tr>
                <tr>
                    <td><strong>{LANG.api_check_time}</strong></td>
                    <td class="form-inline">
                        <div class="input-group">
                            <input type="number" name="api_check_time" value="{DATA.api_check_time}" min="1" max="1440" class="form-control">
                            <span class="input-group-addon">{GLANG.sec}</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><strong>{LANG.cookie_notice_popup}</strong></td>
                    <td><input type="checkbox" name="cookie_notice_popup" value="1"{CHECKED_COOKIE_NOTICE_POPUP}/></td>
                </tr>
                <tr>
                    <td><strong>{LANG.error_send_email}</strong></td>
                    <td><input type="email" name="error_send_email" value="{DATA.error_send_email}" class="form-control" style="width: 450px"/></td>
                </tr>
                <!-- END: system -->
                <tr>
                    <td><strong>{LANG.searchEngineUniqueID}</strong></td>
                    <td><input type="text" name="searchEngineUniqueID" value="{DATA.searchEngineUniqueID}" class="form-control" style="width: 450px" maxlength="50" /></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <caption>
                {LANG.notification_config}
            </caption>
            <col class="w500" />
            <tbody>
                <tr>
                    <td><strong>{LANG.notification_active}</strong></td>
                    <td><input type="checkbox" name="notification_active" value="1" {CHECKED_NOTIFI_ACTIVE} /></td>
                </tr>
                <tr>
                    <td><strong>{LANG.notification_autodel}</strong><span class="help-block">{LANG.notification_autodel_note}</span></td>
                    <td><input type="text" name="notification_autodel" value="{DATA.notification_autodel}" class="form-control w100 pull-left" />&nbsp;<span class="text-middle">{LANG.notification_day}</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="text-center">
        <input type="hidden" name="checkss" value="{DATA.checkss}" />
        <input type="submit" name="submit" value="{LANG.submit}" class="btn btn-primary"/>
    </div>
</form>
<script type="text/javascript">
function reopeningTimeShow(t) {
    var v = $(t).val();
    if (v == '0') {
        $("#reopening_time").hide()
    } else {
        $("#reopening_time").show()
    }
}
$(document).ready(function() {
    $("#site_timezone").select2();

    $("#reopening_date").datepicker({
        showOn : "both",
        dateFormat : "dd/mm/yy",
        changeMonth : true,
        changeYear : true,
        showOtherMonths : true,
        buttonImage : nv_base_siteurl + "assets/images/calendar.gif",
        buttonImageOnly : true
    });
});

var LANG = [];
LANG.note_ssl = "{LANG.note_ssl}";
var CFG = [];
CFG.cdndl = "{NV_CHECK_SESSION}";
</script>
<!-- END: main -->
