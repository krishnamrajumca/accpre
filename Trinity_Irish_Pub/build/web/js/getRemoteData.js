$(function () {
    var url=document.form1.url.value;
    
    $.ajax(url, {
        dataType: "json",
        contenttype:"appication/json",
        converters: {
        'json': jQuery.parseJSON,
    },
        success: function (data) {
            successCallback(data);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) { 
                //$("#tweets ul").append("Server not found");
                    alert("Status: " + textStatus); alert("Error: " + errorThrown); 
                    window.location.href="menu.jsp";
                }         
    });
});
function successCallback(data) {
    var json=JSON.stringify(data);
    alert(data);
    document.form1.data.value=json;
    document.getElementById("form1").submit();
};