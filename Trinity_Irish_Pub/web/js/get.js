$(function () {
    var url=document.form1.url.value;
    var url2=document.form1.tourl.value;
    
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
                $("#tweets ul").append("Server not found");
                    alert("uStatus: " + textStatus); alert("Error: " + errorThrown); 
                    window.location.href="";
                }         
    });
});
function successCallback(data) {
    var json=JSON.stringify(data);
    document.form1.data.value=json;
    
    document.getElementById("form1").submit();
};