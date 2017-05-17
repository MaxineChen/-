function begin() {
//    alert("123");
    document.getElementById("name").value = "MCC";
    document.getElementById("role").value = "编辑";
    document.getElementById("email").value = "ccmmxxccmmxx@163.com";
    document.getElementById("password").value = "hide";
    document.getElementById("resume").value = "An editor.";
    document.getElementById("errorAlert").innerHTML = "";
}

function saveChange() {
//    alert("456");
    document.getElementById("errorAlert").innerHTML = "昵称只允许使用数字、英文与_";
}

function cancelChange() {
    begin();
}