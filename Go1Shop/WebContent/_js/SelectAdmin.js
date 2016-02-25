var btn = document.getElementById("buttonLoad"), xhr = null;
var displayResult = document.getElementById("displayResult");
btn.addEventListener("click", load);

function load() {
	var mail = document.getElementById("ad_mail").value;
	xhr = new XMLHttpRequest();
	xhr.addEventListener("readystatechange", callback);
	xhr.open("get",
			"/Go1Shop/Admin/SelectAdmin.controller?pageStatus=query&ad_mail="+ mail, true);
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
			var tbody = document.getElementById("tbody");
			var rowCount = tbody.rows.length;
			for (var i = (rowCount - 1); i >= 0; i--) {
				tbody.deleteRow(i);
			}
			var resultCount = document.getElementById("resultCount");
			resultCount.innerHTML = " ";
			if (dataResult.length > 0) {
				// 步驟四顯示資料
					for (var i = 0; i < dataResult.length; i++) {
					array = [document.createTextNode(dataResult[i].mail)];
					var tr = document.createElement("tr");
					for (var j = 0; j < 1; j++) {
						var td = document.createElement("td");
						td.appendChild(array[j]);
						tr.appendChild(td);
					}
					td = document.createElement("td");
					td.innerHTML = "<input type='button' name='delete' value='刪除' onClick='doDelete(\""
							+ dataResult[i].mail + "\")'>";
					tr.appendChild(td);
					tbody.appendChild(tr);
				}
				resultCount.innerHTML = "共" + dataResult.length + "筆";
			} else {
				alert(datas.returnMessage);
			}
		} else {
			alert(xhr.status + ":" + xhr.statusText);
		}

	}
}
function doDelete(deleteMail) {
	var mail = document.getElementById("ad_mail").value;
	xhr = new XMLHttpRequest();
	xhr.addEventListener("readystatechange", callback);
	xhr.open("get",
			"/Go1Shop/Admin/SelectAdmin.controller?pageStatus=delete&ad_mail="
					+ mail + "&deleteMail=" + deleteMail,true);
	xhr.send();
}