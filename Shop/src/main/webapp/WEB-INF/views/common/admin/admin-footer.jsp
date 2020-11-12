<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

			<!-- FOOTER -->
			<footer id="footer" class="aside-primary text-white">
				<div class="p-3 fs--14">
					&copy; My Company LLC



					<div class="d-inline-block float-end dropdown">
						<ul class="list-inline m-0">

							<!-- LANGUAGE -->
							<li class="dropdown list-inline-item m-0">

								<a id="topDDLanguage" href="#!" class="d-inline-block" data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">
									<i class="flag flag-us"></i> 
									<span class="pl-2 pr-2">ENGLISH</span>
								</a>

								<div aria-labelledby="topDDLanguage" class="dropdown-menu fs--13 px-1 pt-1 pb-0 m-0 max-h-50vh scrollable-vertical dropdown-menu-right">
									<a href="#!" class="active dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
										<i class="flag flag-us"></i> 
										ENGLISH
									</a>
									<a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
										<i class="flag flag-de"></i> 
										GERMAN
									</a>
									<a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
										<i class="flag flag-fr"></i> 
										FRANCAISE
									</a>
								</div>

							</li>
							<!-- /LANGUAGE -->


							<!-- CURRENCY -->
							<li class="dropdown list-inline-item m-0">

								<span class="text-muted">/</span><!-- optional separator -->

								<a id="topDDCurrency" href="#" class="d-inline-block" data-toggle="dropdown" aria-expanded="false">
									<span class="pl-2 pr-2">USD</span>
								</a>

								<div aria-labelledby="topDDCurrency" class="dropdown-menu text-center fs--13 px-1 pt-1 pb-0 m-0 max-h-50vh w-auto scrollable-vertical dropdown-menu-right">
									<a href="#!" class="active dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
										USD
									</a>
									<a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
										EUR
									</a>
									<a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
										GBP
									</a>
								</div>

							</li>
							<!-- /CURRENCY -->

						</ul>
					</div>


				</div>
			</footer>
			<!-- /FOOTER -->


		</div><!-- /#wrapper -->



		<script src="${contextPath}/resources/assets/js/core.min.js"></script>


		<!--

			[SOW Ajax Navigation Plugin] [AJAX ONLY, IF USED]
			If you have specific page js files, wrap them inside #page_js_files 
			Ajax Navigation will use them for this page! 
			This way you can load this page in a normal way and/or via ajax.
			(you can change/add more containers in sow.config.js)

			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			NOTE: This is mostly for frontend, full ajax navigation!
			Admin Panels use a backend, so the content should be served without
			menu, header, etc! Else, the ajax has no reason to be used because will
			not minimize server load!

			/documentation/plugins-sow-ajax-navigation.html
			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

		-->
		<div id="page_js_files"><!-- specific page javascript files here --></div>

	</body>
</html>