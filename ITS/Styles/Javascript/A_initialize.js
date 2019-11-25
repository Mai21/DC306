$(document).ready(function () {
    // if it's reload, inputArea should open  
    if (document.getElementById('contentBody_lbMessage').innerText != '') {
    //if (!$('#contentBody_lbErrMessageTitle').innerText) {
        //$('#inputArea').display('block');
        document.getElementById('inputArea').style.display = 'block';
        //$('#btnShowInputArea').display('none');
        document.getElementById('btnShowInputArea').style.display = 'none';
    }
});
