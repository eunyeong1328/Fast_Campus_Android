<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>

<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="UTF-8">
		<title><tiles:insertAttribute name="title" /></title>	
		<meta name="description" content="...">

        <meta name="viewport" content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

        <!-- up to 10% speed up for external res -->
        <link rel="dns-prefetch" href="https://fonts.googleapis.com/">
        <link rel="dns-prefetch" href="https://fonts.gstatic.com/">
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/">
        <!-- preloading icon font is helping to speed up a little bit -->
        <link rel="preload" href="${contextPath}/resources/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>

        <!-- non block rendering : page speed : js = polyfill for old browsers missing `preload` -->
        <link rel="stylesheet" href="${contextPath}/resources/assets/css/core.css">
        <link rel="stylesheet" href="${contextPath}/resources/assets/css/vendor_bundle.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">

		<!-- favicon -->
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="apple-touch-icon" href="${contextPath}/resources/demo.files/logo/icon_512x512.png">

		<link rel="manifest" href="${contextPath}/resources/assets/images/manifest/manifest.json">
		<meta name="theme-color" content="#377dff">
<!--font-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">

</head>


			<header>
				<tiles:insertAttribute name="aside" /> 
			</header>
			<article>
			 	<tiles:insertAttribute name="body" />
			</article>
			<footer>
				<tiles:insertAttribute name="footer" />
			</footer>
</body>
        
        