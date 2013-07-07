<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
<title>Users list</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="currentPage" content="userManagement"/>
<meta name="currentCategory" content="user"/>
</head>
<body>

<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/css/common/main.css'/>" />
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/css/common/redmond/jquery-ui-1.8.16.custom.css'/>" />
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/css/common/ui.jqgrid.css'/>" />

<script src="<c:url value='/js/common/jquery-1.6.2.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/common/i18n/grid.locale-en.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/common/jquery.jqGrid.min.js'/>" type="text/javascript"></script>

<c:url value="/delete" var="deleteUrl"/>

<script type="text/javascript">
    $(function() {
        $("#list").jqGrid({
            url : '${ctx}/getUsersList.do',
            datatype : 'json',
            mtype : 'GET',
            colNames : ['User Name', 'email', 'Phone', 'QQ'],
            colModel : [{
                name : 'username',
                index : 'username',
                width : 150
            },{
                name : 'email',
                index : 'email',
                width : 150
            },{
                name : 'telephone',
                index : 'telephone',
                width : 150
            },{
                name : 'qqNbr',
                index : 'qqNbr',
                width : 150
            }],
            pager : '#pager',
            rowNum : 10,
            rowList : [10, 15, 20],
            height : 275, 
            multiselect : true, 
            multiselectWidth : 25,
            rownumbers : true,
            sortname : 'id',
            sortorder : 'asc',
            viewrecords : true,
            gridview : true,
            altRows : true,
            caption : '${title}',
            jsonReader : {
                root : "rows",
                page : "pageNumber",
                total : "pagesAmount",
                records : "recordsTotalAmount",
                repeatitems: false
            }
        });
        
        jQuery("#list").jqGrid('navGrid','#pager',
                {add:false,edit:false,del:false,search:false},
            	{},
            	{}, // add options
            	{}, // del options
             	{} // search options
        );
        
		$("#list").navButtonAdd('#pager',
				{ 	caption:"Delete",
					buttonicon:"ui-icon-trash",
					onClickButton: deleteRow,
					position: "last",
					title:"",
					cursor: "pointer"
				}
		);
        
    });
    
	function deleteRow() {
		// Get the currently selected row
	    var row = $('#list').jqGrid('getGridParam','selrow');

	    // A pop-up dialog will appear to confirm the selected action
		if( row != null )
			$('#list').jqGrid( 'delGridRow', row,
	          	{	//url:'${deleteUrl}',
					url : "/delete",
					recreateForm: true,
				    beforeShowForm: function(form) {
				    	//Change title
				        $(".delmsg").replaceWith('<span style="white-space: pre;">' +
				        		'Delete selected record?' + '</span>');
		            	//hide arrows
				        $('#pData').hide();
				        $('#nData').hide();
				    },
	          		reloadAfterSubmit:true,
	          		closeAfterDelete: true,
	          		serializeDelData: function (postdata) {
		          	      var rowdata = $('#list').getRowData(postdata.id);
		          	      // append postdata with any information
		          	      return {id: postdata.id, oper: postdata.oper, userId: rowdata.id};
		          	},
	          		afterSubmit : function(response, postdata)
					{
			            var result = eval('(' + response.responseText + ')');
						var errors = "";

			            if (result.success == false) {
							for (var i = 0; i < result.message.length; i++) {
								errors +=  result.message[i] + "<br/>";
							}
			            }  else {
			            	$('#msgbox').text('Entry has been deleted successfully');
							$('#msgbox').dialog(
									{	title: 'Success',
										modal: true,
										buttons: {"Ok": function()  {
											$(this).dialog("close");}
										}
									});
		                }
				    	// only used for adding new records
				    	var newId = null;

						return [result.success, errors, newId];
					}
	          	});
		else {
			$('#msgbox').text('You must select a record first!');
			$('#msgbox').dialog(
					{	title: 'Error',
						modal: true,
						buttons: {"Ok": function()  {
							$(this).dialog("close");}
						}
					});
		}
	}
</script>

    <div id="container">
        <table id="list">
            <tr>
                <td />
            </tr>
        </table>
        <div id="pager"></div>
    </div>
    
    <div id='msgbox' title='' style='display:none'></div>
</body>
</html>
