<%@attribute name="title" required="true"%>
<%@attribute name="value" required="true"%>
<%@attribute name="icon" required="true"%>
<%@taglib tagdir="/WEB-INF/tags/utils" prefix="util"%>
<div class="card bd--left bd--green shadow py-2">
	<div class="card-body text--green">
		<div class="row no-gutters align-items-center">
			<div class="col mr-2">
				<div class="text-xs font-weight-bold text-uppercase mb-1">
					${title}
				</div>
				<div class="h5 mb-0 font-weight-bold text--secondary">
					${value}
				</div>
			</div>
			<div class="col-auto">
				<util:icon name="${icon}" />
			</div>
		</div>
	</div>
</div>