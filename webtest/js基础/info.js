var peoples = 0;

function more_info() {
    var now = peoples + 1;
    document.getElementById("extra_info").innerHTML  += "<tr id='people" + now.toString()+"'>\n"+
        "<td>姓名:<input type=\"text\"></td>\n" +
        "<td>关系:<input type=\"text\" class=\"relation\"></td>\n" +
        "<td>收入:<input type=\"number\" required min='0' id='people" + now.toString() +
        "have'></td>"+
        "</tr>";
    peoples += 1;
}

function less_info() {
    if (peoples <= 0){
        alert("没有可删除的内容");
    }
    else{
        var tr = document.getElementById("people" + peoples.toString());
        tr.parentNode.removeChild(tr);
        peoples -= 1;
        alert("删除完成.");
    }
}

function push(){
    var m = Number(document.getElementById("all-summary-info").innerText) + 1;
    var money = 0;
    var who = document.getElementById("stu_name").value;
    var who_sex = document.getElementsByName("sex");
    var who_email = document.getElementById("stu_mail").value;
    var who_tel = document.getElementById("stu_tel").value;
    for (j = 0; j < who_sex.length; j++){
        if (who_sex[j].checked){
            var checked_sex = who_sex[j].value;
        }
    }
    for (i = 0; i < peoples + 1; i++) {
        money += Number(document.getElementById("people" + i.toString() + "have").value);
    }
    document.getElementById("all-summary-info").innerText = m;
    document.getElementById("this-family-have").innerText = money.toString();
    document.getElementById("this-people-num").innerText = peoples + 1;
    document.getElementById("submit-students-info").innerHTML +=
        "<tr>" +
        "<td>" + who.toString() +"</td>" +
        "<td>" + checked_sex.toString() + "</td>" +
        "<td>" + who_email.toString() + "</td>" +
        "<td>" + who_tel.toString() + "</td>" +
        "<td>" + money.toString() + "</td>" +
        "</tr>";
}
