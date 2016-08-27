var init = function init() {
  var selectFeatures = $("#selectFeatures"); // Get select feature component
  var buttonAddFeature = $("#buttonAddFeature"); // Get button feature component
  var tableFeaturesProperties = $("#tableFeaturesProperties"); // Get table feature component

  buttonAddFeature.on("click", function() {
    // Get selected options
		var selectedOptions = $("#selectFeatures option:selected");

    // Iterate through all selected options
    $.each(selectedOptions, function (i, item) {
    	var text = $(item).text(); // Get text
    	var value = $(item).val(); // Get value

    	//verifies the existence of cost center in the table
    	if (!isFeatureInTable(value)) {
	      var openTr = `<tr id=featureIdRow-${value}>`;
    		var tdTextFeatureId = `<td class="hidden"><input type="text" value=${value} /></td>`;
        var tdTextFeatureName = `<td>${text}</td>`;
        var tdTextQuantity = `<td><input class="form-control" type="number" value="0" /></td>`;
    		var tdButtonRemove = `<td class="text-center"><a class="btn btn-danger btn-xs" id="btnRemoveFeature-${value}"><i class="glyphicon glyphicon-remove"></i></a></td>`;
    		var closeTr = `</tr>`;

        // Build row with all elements
    		var row = openTr + tdTextFeatureId + tdTextFeatureName + tdTextQuantity + tdButtonRemove + closeTr;

        // Append row to body table
    		$("#tableFeaturesProperties > tbody").append(row);

    		// Add action click to remove button added to DOM
    		addEventToButtonRemoveFeature();
    	}
    });

    // Clear select
		$('#selectFeatures').val('');
	});

  // Verify whether feature is already in table
  function isFeatureInTable(value) {
		var featureExists = false;

    // Iterate through all rows in table
		$("#tableFeaturesProperties > tbody tr").each(function() {
			var tableRowId = this.id;
			var featureId = tableRowId.split("featureIdRow-")[1];

			if(featureId == value) {
				featureExists = true;
			}
		});

		return featureExists;
	}

  function addEventToButtonRemoveFeature(){
		$("#tableFeaturesProperties > tbody tr td a").on("click", function() {
			var tableRowId = this.id;
			var featureId = tableRowId.split("btnRemoveFeature-")[1];

			$("#featureIdRow-" + featureId).remove();
		});
	}

  addEventToButtonRemoveFeature();
}

$(document).ready(init);
