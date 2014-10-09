<%
	def appMenuItems = []
	def userMenuItems = []

	if (context.authenticatedUser) {

		appMenuItems << """<a href="/${ contextPath }/index.htm?${ config.context ? config.context : "" }"><img src="${ ui.resourceLink("kenyaui", "images/toolbar/home.png") }" width="12" height="12" />&nbsp;&nbsp;Home</a>"""

		if (currentApp) {
			appMenuItems << """<a href="/${ contextPath }/${ currentApp.url }">${ currentApp.label }</a>"""
		}

		userMenuItems << """<span>Logged in as <i>${ context.authenticatedUser.personName }</i></span>"""
		userMenuItems << """<a href="javascript:ke_logout()">Log Out</a>"""
	}
%>

<div class="ke-toolbar">
	<div class="ke-apptoolbar">
		<% appMenuItems.each { item -> %><div class="ke-toolbar-item">${ item }</div><% } %>
	</div>
	<div class="ke-usertoolbar">
		<% userMenuItems.each { item -> %><div class="ke-toolbar-item">${ item }</div><% } %>
	</div>
	<div style="clear: both"></div>
</div>
<script type="text/javascript">
	function ke_logout() {
		kenyaui.openConfirmDialog({ heading: 'Logout', message: 'Logout and end session?', okCallback: function() {
			ui.navigate('/${ contextPath }/logout');
		}});
	}
</script>