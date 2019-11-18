// validation
function validationLogin() {
    var userid = document.getElementById('tbUserID').value;
    var password = document.getElementById('tbPassword').value;
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
        document.getElementById('lbErrMessageUserID').innerText = errMessageUserID;
        document.getElementById('lbErrMessagePassword').innerText = errMessagePassword;
        return false;
    }
};

function validationTitle() {
    var title = document.getElementById('tbTitle').value;
    var errMessageTitle = '';

    // Check ID if blank and including symbols
    if (!title) {
        errMessageTitle = 'Title is empty!'
    }/* else {
        var reg = new RegExp(/[!"#$%&'()\*\+\-\/=?\[\\\]^_`{|}~]/g);
        if (reg.test(userid)) {
            errMessageTitle = 'Invalid Symbols() are used in Title'
        }
    }*/

    if (!errMessageTitle) {
        // No error
        return true;
    } else {
        // Error, don't move to dashboard
        document.getElementById('lbErrMessageTitle').innerText = errMessageTitle;
        return false;
    }
};

$(document).ready(function () {
    $('#buttonShowInputArea').click(function () {
        alert('aaaaaa');
        const element = document.getElementById("inputArea");
        if (element.style.display == "block") {
            // noneで非表示
            element.style.display = "none";
            document.getElementById("buttonShowInputArea").style.display = "block";
        } else {
            // blockで表示
            element.style.display = "block";
            document.getElementById("buttonShowInputArea").style.display = "none";
        }
    });
});
