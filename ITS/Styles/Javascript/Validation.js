// validation
function validationLogin() {
    var userid = document.getElementById('contentBody_tbUserID').value;
    var password = document.getElementById('contentBody_tbPassword').value;
  
    var errMessageUserID = '';
    var errMessagePassword = '';
    
    // Check ID if blank and including symbols
    if (!userid) {
        errMessageUserID = 'UserID is empty!'
    } else {
        var reg = new RegExp(/[!"#$%&'()\*\+\-\.,\/:;<=>?@\[\\\]^_`{|}~]/g);
        if (reg.test(userid)) {
            errMessageUserID = 'Symbols are not allowed in UserID'
        }
    }

    // Check ID if blank
    if (!password) {
        errMessagePassword = 'Password is empty!'
    }

    if (!errMessageUserID && !errMessagePassword) {
        // No error
        return true;
    } else {
        // Error, don't move to dashboard
        document.getElementById('contentBody_lbErrMessageUserID').innerText = errMessageUserID;
        document.getElementById('contentBody_lbErrMessagePassword').innerText = errMessagePassword;
        return false;
    }
};

function validationTitle() {
    var title = document.getElementById('contentBody_tbTitle').value;
    var errMessageTitle = '';
    document.getElementById('contentBody_lbMessage').innerText = '';

    // Check ID if blank and including symbols
    if (!title) {
        errMessageTitle = 'Title is empty!'
    }

    if (!errMessageTitle) {
        // No error
        return true;
    } else {
        // Error, don't move to dashboard
        document.getElementById('contentBody_lbMessage').innerText = errMessageTitle;
        return false;
    }
};

function validationCW(){
    if (!document.getElementById('contentBody_tbPassword').value) {
        document.getElementById('contentBody_lbErrPassword').innerText = 'Password is empty!';
        isErr = true;
    }

    if (!document.getElementById('contentBody_tbConfirm').value) {
        document.getElementById('contentBody_lbErrConfirm').innerText = 'Password Comfirmation is empty!';
        isErr = true;
    } else {
        if (document.getElementById('contentBody_tbPassword').value != document.getElementById('contentBody_tbConfirm').value) {
            document.getElementById('contentBody_lbErrConfirm').innerText = 'Password and Password Comfirmation are different!';
            isErr = true;
        }
    }

    if (isErr == true) {
        // Error, don't move to dashboard
        document.getElementById('contentBody_lbMessage').innerText = 'Error occur!';
        return false;
    } else {
        return true;
    }
}

function editTitle(button, level){

    // get index of items
    var obj_id = button.id;
    var index = obj_id.lastIndexOf('_');
    var obj_num = obj_id.substr(index+1); 

    // get value of data
    var edit_title_id = document.getElementById('contentBody_ListView1_idLabel_' + obj_num).innerHTML; 
    var edit_title = document.getElementById('contentBody_ListView1_title_nameLabel_' + obj_num).innerHTML;
    //var edit_tier_num = document.getElementById('contentBody_ListView1_tier_levelLabel_' + obj_num).innerHTML;

    // set inputArea
    document.getElementById('contentBody_hfTitleId').value = edit_title_id;
    document.getElementById('contentBody_tbTitle').value = edit_title;
    document.getElementById('contentBody_rblTier_' + level).checked = 'checked';
    document.getElementById('contentBody_btnExecute').value = 'Update';
    document.getElementById('contentBody_lbMessage').innerHTML = '';

    document.getElementById('inputArea').style.display = 'block';
    document.getElementById('btnShowInputArea').style.display = 'none';

    return false;
}

function validationUser() {
    var isErr = false;
    var regId = new RegExp(/[!"#$%&'()\*\+\-\.,\/:;<=>?@\[\\\]^_`{|}~]/g);
    var regName = new RegExp(/[!"#$%&'()\*\+,\/:;<=>?@\[\\\]^_`{|}~]/g);

    // Check if blank and including symbols
    if (!document.getElementById('contentBody_tbUserID').value) {
        document.getElementById('contentBody_lbErrUserID').innerText = 'UserID is empty!\n';
        isErr = true;    
    } else {
        if (regId.test(document.getElementById('contentBody_tbUserID').value)) {
            document.getElementById('contentBody_lbErrUserID').innerText = 'Symbols are not allowed in UserID';
            isErr = true;    
        }
    }

    if (!document.getElementById('contentBody_tbFirstName').value) {
        document.getElementById('contentBody_lbErrFirstName').innerText = 'FirstName is empty!';
        isErr = true;    
    } else {
        if (regName.test(document.getElementById('contentBody_tbFirstName').value)) {
            document.getElementById('contentBody_lbErrLastName').innerText = 'Symbols are not allowed in FirstName';
            isErr = true;    
        }
    }

    if (!document.getElementById('contentBody_tbLastName').value) {
        document.getElementById('contentBody_lbErrLastName').innerText = 'LastName is empty!';
        isErr = true;    
    } else {
        if (regName.test(document.getElementById('contentBody_tbLastName').value)) {
            document.getElementById('contentBody_lbErrLastName').innerText = 'Symbols are not allowed in LastName';
            isErr = true;
        }
    }

    if (!document.getElementById('contentBody_tbEmail').value) {
        document.getElementById('contentBody_lbErrEmail').innerText = 'Email is empty!';
        isErr = true;
    }

    // only when add
    // disabled かどうか確認して、disabledのときには処理しない
    if (document.getElementById('contentBody_tbPassword').disabled == false) {
        if (!document.getElementById('contentBody_tbPassword').value) {
            document.getElementById('contentBody_lbErrPassword').innerText = 'Password is empty!';
            isErr = true;
        }

        if (!document.getElementById('contentBody_tbConfirm').value) {
            document.getElementById('contentBody_lbErrConfirm').innerText = 'Password Comfirmation is empty!';
            isErr = true;
        } else {
            if (document.getElementById('contentBody_tbPassword').value != document.getElementById('contentBody_tbConfirm').value) {
                document.getElementById('contentBody_lbErrConfirm').innerText = 'Password and Password Comfirmation are different!';
                isErr = true;
            }
        }
    }
    
    if (isErr == true) {
        // Error, don't move to dashboard
        document.getElementById('contentBody_lbMessage').innerText = 'Error occur!';
        return false;
    } else {
        return true;
    }
    
    

};

function editUser(button) {

    // get index of items
    var obj_id = button.id;
    var index = obj_id.lastIndexOf('_');
    var obj_num = obj_id.substr(index + 1);

    // get value of data
    var edit_user_id = document.getElementById('contentBody_ListView1_idLabel_' + obj_num).innerHTML;
    var edit_first_name = document.getElementById('contentBody_ListView1_first_nameLabel_' + obj_num).innerHTML;
    var edit_last_name = document.getElementById('contentBody_ListView1_last_nameLabel_' + obj_num).innerHTML;
    var edit_e_mail = document.getElementById('contentBody_ListView1_e_mailLabel_' + obj_num).innerHTML;

    
    //var edit_tier_num = document.getElementById('contentBody_ListView1_tier_levelLabel_' + obj_num).innerHTML;

    // set inputArea
    document.getElementById('contentBody_tbUserID').value = edit_user_id;
    document.getElementById('contentBody_tbFirstName').value = edit_first_name;
    document.getElementById('contentBody_tbLastName').value = edit_last_name;
    document.getElementById('contentBody_tbEmail').value = edit_e_mail;
    document.getElementById('contentBody_hfFlg').value = 'true';
    //document.getElementById('contentBody_rblTier_' + level).checked = 'checked';
    document.getElementById('contentBody_btnExecute').value = 'Update';
    document.getElementById('contentBody_lbMessage').innerHTML = '';

    document.getElementById('contentBody_tbPassword').disabled = true;
    document.getElementById('contentBody_tbConfirm').disabled = true;

    document.getElementById('inputArea').style.display = 'block';
    document.getElementById('btnShowInputArea').style.display = 'none';

    $("#inputArea").get(0).scrollIntoView(true);

    return false;
}


function clearUser()
{
    /*document.getElementById('contentBody_btnExecute').value = 'Add';
    document.getElementById('contentBody_tbUserID').value = '';
    document.getElementById('contentBody_tbFirstName').value = '';
    document.getElementById('contentBody_tbLastName').value = '';
    document.getElementById('contentBody_tbEmail').value = '';
    document.getElementById('contentBody_tbPassword').value = '';
    document.getElementById('contentBody_tbConfirm').value = '';
    document.getElementById('contentBody_hdFlg').value = "false";

    //document.getElementById('contentBody_rblTier_0').checked = 'checked';
    document.getElementById('contentBody_lbMessage').innerHTML = '';
    document.getElementById('contentBody_lbErrUserID').innerText = '';
    document.getElementById('contentBody_lbErrLastName').innerText = '';
    document.getElementById('contentBody_lbErrLastName').innerText = '';
    document.getElementById('contentBody_lbErrEmail').innerText = '';
    document.getElementById('contentBody_lbErrPassword').innerText = '';
    document.getElementById('contentBody_lbErrConfirm').innerText = '';*/

    clearInputInfo();

    document.getElementById('contentBody_tbPassword').disabled = false;
    document.getElementById('contentBody_tbConfirm').disabled = false;
}


function setUser(button) {

    // get index of items
    var obj_id = button.id;
    var index = obj_id.lastIndexOf('_');
    var obj_num = obj_id.substr(index + 1);

    // get value of data
    var user_id = document.getElementById('contentBody_ListView1_idLabel_' + obj_num).innerHTML;
 
    // set inputArea
    if (!user_id) {
        document.getElementById('contentBody_lbMessage').innerHTML = 'System Error! Failed to Password Change Request.';
        return false;
    } else
    {
        document.getElementById('contentBody_hfTargetId').value = user_id;
        return true;
    }
    
}

$(document).ready(function () {
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
        //$(this).find('span.lb').html('');
        $(this).find('input.tb').val('');
        $(this).find('div.hf').children('input').val('');
        $("input[type='radio']").val(["0"]);
    });
    $("#inputArea > span").each(function () {
        $(this).html('');
    });
};

function validationRecover() {
    var userid = document.getElementById('contentBody_tbUserID').value;

    var errMessageUserID = '';

    // Check ID if blank and including symbols
    if (!userid) {
        errMessageUserID = 'UserID is empty!'
    } else {
        var reg = new RegExp(/[!"#$%&'()\*\+\-\.,\/:;<=>?@\[\\\]^_`{|}~]/g);
        if (reg.test(userid)) {
            errMessageUserID = 'Symbols are not allowed in UserID'
        }
    }

    if (!errMessageUserID) {
        // No error
        return true;
    } else {
        // Error, don't move to dashboard
        document.getElementById('contentBody_lbMessage').innerText = errMessageUserID;
        return false;
    }
};