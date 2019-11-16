// validation
function validationLogin() {
    var userid = document.getElementById('txtUserID').value;
    var password = document.getElementById('txtPassword').value;
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
