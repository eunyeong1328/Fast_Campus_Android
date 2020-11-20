	<!-- 

		SHIPPING ADDRESS 

	-->
	<form novalidate class="bs-validate" method="post" action="#">

		<div class="modal-header">
			<h2 class="modal-title fs--18 m-0">
				Address
			</h2>

			<button type="button" class="close pointer" data-dismiss="modal" aria-label="Close">
				<span class="fi fi-close fs--18" aria-hidden="true"></span>
			</button>
		</div>

		<div class="modal-body">

			<div class="row">

				<div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<input required placeholder="First Name" id="addr_first_name" name="addr_first_name" type="text" class="form-control">
						<label for="addr_first_name"> ㄴㄴ </label>
					</div>

				</div>
				
				<div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<input required placeholder="Last Name" id="addr_last_name" name="addr_last_name" type="text" class="form-control">
						<label for="addr_last_name">  </label>
					</div>

				</div>


				<div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<input placeholder="Phone Number" id="addr_phone" name="addr_phone" type="text" class="form-control">
						<label for="addr_phone"> </label>
					</div>

				</div>


				<div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<input placeholder="Company Name" id="addr_company_name" name="addr_company_name" type="text" class="form-control">
						<label for="addr_company_name">한글 인코딩 작업</label>
					</div>

				</div>




				<div class="col-12 col-sm-12 col-lg-12 mb--20">

					<div class="form-label-group mb-3">
						<input required placeholder="Street and Number, P.O. Box, c/o." id="addr_address_1" name="addr_address_1" type="text" class="form-control">
						<label for="addr_address_1">Street and Number, P.O. Box, c/o.</label>
					</div>

					<div class="form-label-group mb-3">
						<input placeholder="Apt, Suite, Unit, Building, Floor, etc" id="addr_address_2" name="addr_address_2" type="text" class="form-control">
						<label for="addr_address_2">Apt, Suite, Unit, Building, Floor, etc</label>
					</div>

				</div>







				<div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<input placeholder="City/Town" id="addr_city" name="addr_city" type="text" class="form-control">
						<label for="addr_city">City/Town</label>
					</div>

				</div>


				<div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<input placeholder="Zip / Postal Code" id="addr_zipcode" name="addr_zipcode" type="text" class="form-control">
						<label for="addr_zipcode">Zip / Postal Code</label>
					</div>

				</div>


				<div class="col-12 col-sm-6 col-lg-6">

					<!-- 
						based on `SOW : Ajax Select` plugin 
						documentation/plugins-sow-ajax-select.html
					-->
					<select name="addr_country" class="form-control js-ajax bs-select" data-ajax-target="#addr_state" data-live-search="true">
						<option value="0">Select Contry...</option>
						<option value="1">United States</option>
						<option value="2">Romania</option>
					</select>

				</div>


				<div class="col-12 col-sm-6 col-lg-6">

					<!-- 
						based on `SOW : Ajax Select` plugin 
						documentation/plugins-sow-ajax-select.html
					-->
					<select name="addr_state" id="addr_state" class="form-control bs-select" disabled=""
						data-ajax-url="_ajax/select_ajax_state_list.php" 
						data-ajax-method="GET" 
						data-ajax-params="['action','get_state_list']['param2','value2']" 
						data-live-search="true">
						<option value="">Select Country First</option>
					</select>

				</div>

			</div>

		</div>

		<div class="modal-footer">
			<button type="submit" class="btn btn-sm btn-primary">
				<i class="fi fi-check"></i>
				Save Changes
			</button>

			<a href="#" class="btn btn-sm btn-secondary" data-dismiss="modal">
				<i class="fi fi-close"></i>
				Close
			</a>
		</div>

	</form>