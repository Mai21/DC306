$(document).ready(function () {
    // if it's reload, inputArea should open  
    if (document.getElementById('contentBody_lbErrMessageTitle').innerText != '') {
        document.getElementById('inputArea').style.display = 'block';
        document.getElementById('btnShowInputArea').style.display = 'none';
    }

    $('#btnShowInputArea').click(function () {
        const element = document.getElementById('inputArea');
        if (element.style.display == 'block') {
            // noneで非表示
            element.style.display = 'none';
            document.getElementById('btnShowInputArea').style.display = 'block';
        } else {
            // blockで表示
            element.style.display = 'block';
            document.getElementById('btnShowInputArea').style.display = 'none';
        }
    });

    $('#btnClear').click(function () {
        document.getElementById('contentBody_btnExecute').value = 'Add';
        document.getElementById('contentBody_tbTitle').value = '';
        document.getElementById('contentBody_rblTier_0').checked = 'checked';
        document.getElementById('contentBody_lbErrMessageTitle').innerHTML = '';
    });
});
$(document).ready(function () {
    // if it's reload, inputArea should open  
    if (document.getElementById('contentBody_lbMessage').innerText != '') {
    //if (!$('#contentBody_lbErrMessageTitle').innerText) {
        //$('#inputArea').display('block');
        document.getElementById('inputArea').style.display = 'block';
        //$('#btnShowInputArea').display('none');
        document.getElementById('btnShowInputArea').style.display = 'none';
    }

    $('#btnShowInputArea').click(function () {
        const element = document.getElementById('inputArea');
        if (element.style.display == 'block') {
            // noneで非表示
            element.style.display = 'none';
            document.getElementById('btnShowInputArea').style.display = 'block';
        } else {
            // blockで表示
            element.style.display = 'block';
            document.getElementById('btnShowInputArea').style.display = 'none';
        }
    });

    $('#btnClear').click(function () {
        clearInputInfo();
        //document.getElementById('contentBody_btnExecute').value = 'Add';
        //document.getElementById('contentBody_tbTitle').value = '';
        //document.getElementById('contentBody_rblTier_0').checked = 'checked';
        //document.getElementById('contentBody_lbErrMessageTitle').innerHTML = '';
    });
});

var clearInputInfo = function () {
    $("#inputArea > div").each(function () {
        $(this).find('input.lb').html('');
        $(this).find('input.tb').val('');
        $(this).find('div.hf').children('input').val('');
        $("input[type='radio']").val(["0"]);
    });
};