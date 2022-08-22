var flagID = false;//id중복체크 확인 여부

function check() {
    if (flagID == false) {
        alert("ID 중복체크 하세요");
        return;
    }
}

function flagID(){ flagID=true; }


function checkUID() {
    flagID = true;
    open('openSb.jsp', 'openSb', 'width=400, height=140, left=100, top=200');
}