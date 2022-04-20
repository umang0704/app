<%@page import="java.util.Map"%>
<%@page import="com.eea.dto.response.BaseResponse"%>
<%    

BaseResponse baseResponse = (BaseResponse)request.getAttribute("baseResponse");
Map<String,Object> data = (Map<String,Object>) baseResponse.getData();
  String filename = (String)data.get("filename");   
  String filepath = (String)data.get("filepath");   
  response.setContentType("APPLICATION/OCTET-STREAM");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
            
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   
%>   