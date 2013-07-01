<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	function addLine() {
		var itemCnt = $('#table tr').length;

		var newItem = '<tr id="item_' + itemCnt + '"">'
				+ '<td><input type="text" name="id"</td>'
				+ '<td><input type="text" name="value"</td>' + '</tr>';
		if(itemCnt == 1){
			$('#tableHeader').after(newItem);
		}else{
			$('#item_' + (itemCnt - 1)).after(newItem);
		}
	}
</script>

</head>
<body>
	<table id='table'>
		<tr id='tableHeader'>
			<th>id</th>
			<th>value</th>
		</tr>
	</table>
	<input type="button" value="addRow" onclick="addLine()" />
</body>
</html>