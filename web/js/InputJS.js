let flagID = false;//id중복체크 확인 여부

function check() {
    console.log(flagID);
    if (flagID == false) {
        alert("ID 중복체크 필요");
        location.href='signup.jsp';
        return false;
    }
}

function flagId(){
    flagID=true;
    return flagID;
}

function checkUID() {
    open('openSb.jsp', 'openSb', 'width=600, height=200, left=100, top=200');
}