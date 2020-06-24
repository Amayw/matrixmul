<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/9/21
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Matrix Multiplication</title>
      <link rel="stylesheet" href="css/b.css">
      <script type="text/javascript">
          var xmlHttp;
          function createXMLHttpRequest(){  //1建立XmlHttpRequest对象
              if(window.ActiveXObject){
                  try{
                      xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
                  }catch(e){
                      alert("Error!!!");
                  }
              }else{
                  xmlHttp = new XMLHttpRequest();
              }
          }
          function display(resArr){
              var resultArr=new Array();
              resultArr=resArr[0].split(",");
              var result=new Array();
              for(var m=0;m<resultArr.length-1;m++){
                  result[m]=Number(resultArr[m]);
              }
              var size=new Array();
              size=resArr[1].split(",");
              var row=Number(size[0]);
              var col=Number(size[1]);
              var mytable = '';
              var count=0;
              for(var i=0;i<row;i++){
                  mytable+='<tr>';
                  for(var j=0;j<col;j++){
                      if(count<result.length){
                          mytable+='<td id="td1">'+ result[count] +'</td>';
                          count++;
                      }
                  }
                  mytable+='</tr>';
              }
              document.getElementById("str").innerHTML=mytable;

          }

          function showMes(){   //2设置回调函数
              if(xmlHttp.readyState==4){ //数据接收完成并可以使用
                  if(xmlHttp.status==200){ //http状态OK
                      //5、在回调函数中针对不同响应状态进行处理
                      var resArr=new Array();
                      resArr=xmlHttp.responseText.split("*");
                      display(resArr);
                  }else{
                      alert("出错："+xmlHttp.status); //HTTP状态码对应的文本
                  }
              }
          }
          /**
           //这是GET方法传送
           function getMes(){
      createXMLHttpRequest();
      var txt = document.getElementById("txt").value;
      var url="servlet/AjaxServlet?txt="+txt;
      url = encodeURI(url); //转换码后再传输
      xmlHttp.open("GET",url,true); //3使用Open方法建立与服务器的连接
      xmlHttp.onreadystatechange=showMes;
      xmlHttp.send(null); //4向服务器发送数据
    }
           */
          /**
           *这是post方法
           */
          function postMes(){
              createXMLHttpRequest();
              var left=document.getElementsByName("left");
              var right=document.getElementsByName("right");
              var row1=document.getElementsByName("hei1").length;
              var row2=document.getElementsByName("hei2").length;
              var col1=left.length/Number(row1);
              var col2=right.length/Number(row2);
              var aLeft="";//数组无法直接传，用传递字符串的方法
              for (var i=0;i<left.length; i++) {
                  aLeft=aLeft+left[i].value+",";
              }

              //var aRight="";//数组无法直接传，用传递字符串的方法
              for (var j=0;j<right.length; j++) {
                  aLeft=aLeft+right[j].value+",";
              }
              aLeft=aLeft+"*"+row1+","+col1+","+row2+","+col2+",";
              var url = "ServletMultiplication";
              var params ="al="+aLeft;
              xmlHttp.open("POST",url,true);
              xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
              xmlHttp.send(params);
              xmlHttp.onreadystatechange = showMes;
          }
          /*function fun(){
              var left=document.getElementsByName("left");
              var right=document.getElementsByName("right");
              var row1=document.getElementsByName("hei1").length;
              var row2=document.getElementsByName("hei2").length;
              var col1=left.length/Number(row1);
              var col2=right.length/Number(row2);

              var aLeft="";//数组无法直接传，用传递字符串的方法
              for (var i=0;i<left.length; i++) {
                      aLeft=aLeft+left[i].value+",";
              }

              var aRight="";//数组无法直接传，用传递字符串的方法
              for (var j=0;j<right.length; j++) {
                      aRight=aRight+right[j].value+",";
              }

              $.post("servlet/ServletMultiplication",
                  {al:"aLeft",ar:"aRight",row1:"row1",col1:"col1",row2:"row2",col2:"col2"},
                  function (data) {
                  alert(data);
              });

          }*/
      </script>
  </head>
  <body>
  <div class="container">
      <%!String length1;%>
      <%!String height1;%>
      <%!String length2;%>
      <%!String height2;%>
      <%!int L1;%>
      <%!int H1;%>
      <%!int L2;%>
      <%!int H2;%>
      <%
          length1=request.getParameter("length1");
          height1=request.getParameter("height1");
          length2=request.getParameter("length2");
          height2=request.getParameter("height2");
          L1=Integer.parseInt(length1);
          H1=Integer.parseInt(height1);
          L2=Integer.parseInt(length2);
          H2=Integer.parseInt(height2);
      %>

      <%
          out.println("<div class=divleft>");
          out.println(" <span>请输入第一个矩阵：</span>");
          out.println("<table class=tableft width=200 height=200>");
          for(int i=1;i<=L1;i++){
              out.println("<tr name='hei1'>");
              for(int j=1;j<=H1;j++){
                  out.println("<td>");
                  out.println("<input type='text' name='left' id='left"+i+""+j+"'>");
                  out.println("</td>");
              }
              out.println("</tr>");
          }
          out.println("</table>");
           out.println("</div>");
      %>



      <%
          out.println("<div class=divright>");
          out.println(" <span>请输入第二个矩阵：</span>");
          out.println("<table class=tabright width=200 height=200>");
          for(int i=1;i<=L2;i++){
              out.println("<tr name='hei2'>");
              for(int j=1;j<=H2;j++){
                  out.println("<td>");
                  out.println("<input type='text' name='right' id='left"+i+""+j+"'>");
                  out.println("</td>");
              }
              out.println("</tr>");
          }
          out.println("</table>");
          out.println("</div>");
      %>



      <input type="button" value="result" onclick=postMes() >
      <table class="tabout" width="200" height="200" id="str">
      </table>
      <%--<%!int count=0;%>
      <%

          out.println("<table width=200 height=200>");
          for(int i=1;i<=L1;i++){
              out.println("<tr>");
              for(int j=1;j<=H2;j++){
                  out.println("<td>");
                  out.println("<input type='text'  id='result"+count+"'>");
                  out.println("</td>");
              }
              out.println("</tr>");
          }
          out.println("</table>");
      %>--%>
  </body>
</html>
