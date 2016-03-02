var btn = document.getElementById("buttonLoad"), xhr = null;
var resultCount = document.getElementById("resultCount");
var displayResult = document.getElementById("displayResult");
var tbody = document.getElementById("tbody");
btn.addEventListener("click", load);

function load() {
	var mail = document.getElementById("mail").value;
	var name = document.getElementById("mem_name").value;
	var nickName = document.getElementById("nickName").value;
	var gender = document.getElementById("gender").value;
	var status = document.getElementById("status").value;
	xhr = new XMLHttpRequest();
	xhr.addEventListener("readystatechange", callback);
	xhr.open("get",
			"/Go1Shop/Admin/Properties.controller?pageStatus=query&mail="
					+ mail + "&mem_name=" + name + "&nickName="
					+ nickName + "&gender=" + gender + "&status="
					+ status, true);
	xhr.send();
}

function callback() {
	if (xhr.readyState == 1) {
		document.getElementById("img1").style.display = "inline";
	}
	// readyState=4表示資料已經回傳到Client端了
	if (xhr.readyState == 4) {
		document.getElementById("img1").style.display = "none";
		// status=200確定Server端程式執行沒有錯誤
		if (xhr.status == 200) {
			// 步驟三接收Server端回傳的資料
			var datas = JSON.parse(xhr.responseText);
			var dataResult = datas.result;
			if (dataResult.length > 0) {
				// 步驟四顯示資料
				var rowCount = tbody.rows.length;
				for (var i = (rowCount - 1); i >= 0; i--) {
					tbody.deleteRow(i);
				}
				for (var i = 0; i < dataResult.length; i++) {
					array = [
							document.createTextNode(dataResult[i].mail),
							document.createTextNode(dataResult[i].name),
							document
									.createTextNode(dataResult[i].nickName),
							document.createTextNode(dataResult[i].gender),
							document.createTextNode(dataResult[i].status) ];
					var tr = document.createElement("tr");
					for (var j = 0; j < 5; j++) {
						var td = document.createElement("td");
						td.appendChild(array[j]);
						tr.appendChild(td);
					}
					td = document.createElement("td");
					td.innerHTML = "<input type='button' name='changeStatus' value='變更' onClick='doChange(\""
							+ dataResult[i].mail + "\")'>";
					tr.appendChild(td);
					tbody.appendChild(tr);
				}
				resultCount.innerHTML = "共" + dataResult.length + "筆";
			} else {
				alert(datas.returnMessage);
				var rowCount = tbody.rows.length;
				for (var i = (rowCount - 1); i >= 0; i--) {
					tbody.deleteRow(i);
				}
				resultCount.innerHTML="";
			}
		} else {
			alert(xhr.status + ":" + xhr.statusText);
		}

	}
}
function doChange(changeMail) {
	var mail = document.getElementById("mail").value;
	var name = document.getElementById("mem_name").value;
	var nickName = document.getElementById("nickName").value;
	var gender = document.getElementById("gender").value;
	var status = document.getElementById("status").value;
	xhr = new XMLHttpRequest();
	xhr.addEventListener("readystatechange", callback);
	xhr.open("get",
			"/Go1Shop/Admin/Properties.controller?pageStatus=change&mail="
					+ mail + "&mem_name=" + name + "&nickName="
					+ nickName + "&gender=" + gender + "&status="
					+ status + "&changeMail=" + changeMail, true);
	xhr.send();
}