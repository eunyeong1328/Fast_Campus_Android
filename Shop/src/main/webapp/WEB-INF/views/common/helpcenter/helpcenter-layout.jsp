<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- 자바의 import문처럼 타일즈를 사용하기 위해 반드시 추가해야 합니다. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("utf-8");
%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="...">

<meta name="viewport" content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">

	<!-- up to 10% speed up for external res -->
	<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
	<link rel="dns-prefetch" href="https://fonts.gstatic.com/">
	<link rel="preconnect" href="https://fonts.googleapis.com/">
	<link rel="preconnect" href="https://fonts.gstatic.com/">
	
	<!-- preloading icon font is helping to speed up a little bit -->
	<link rel="preload" href="${contextPath}/resources/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>
	
	<!-- favicon -->
	<link rel="shortcut icon" href="${contextPath}/resources/images/fvc.svg">
	<link rel="shortcut icon" href="${contextPath}/resources/images/favicon.ico">
	<link rel="apple-touch-icon" href="${contextPath}/resources/images/fvc.svg">
	<link rel="apple-touch-icon" href="${contextPath}/resources/images/icon_512x512.png">
	
	<link rel="manifest" href="${contextPath}/resources/assets/images/manifest/manifest.json">
	<meta name="theme-color" content="#377dff">

	<!-- title -->
	<title><tiles:insertAttribute name="title" /></title>
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
	<!-- stylesheet -->
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/core.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/core.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/vendor_bundle.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/joy.css">
	
	<!--font-->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
	
</head>

<body class="layout-admin aside-sticky header-sticky">

	<div id="wrapper" class="d-flex align-items-stretch flex-column">

		<header>
			<tiles:insertAttribute name="header" />
			<!-- tiles.xml의 <definition>의 하위 태그인 <put-attribute>태그의 name이 header인 JSP를 표시합니다. -->
		</header>

		<article>
			<tiles:insertAttribute name="body" />
		</article>

		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>

	</div>

	
	<div id="page_js_files">
		<!-- specific page javascript files here -->
	</div>

</body>

</html>