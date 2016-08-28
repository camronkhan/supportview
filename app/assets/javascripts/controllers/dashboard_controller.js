// Dashboard Controller
app.controller("DashboardController", ["$scope", "paramService", function($scope, paramService) {
	
	$scope.searchProduct = function(productKeywords) {
		paramService.search("product", productKeywords);
	}

	$scope.searchCompany = function(companyKeywords) {
		paramService.search("company", companyKeywords);
	}

	$scope.searchAgent = function(agentKeywords) {
		paramService.search("agent", agentKeywords);
	}

	$scope.searchPortal = function(portalKeywords) {
		paramService.search("portal", portalKeywords);
	}

	$scope.searchGlobalItemMaster = function(gimKeywords) {
		window.location.href = 'http://shamu.comm.mot.com/cgi-bin/gim_screens/gimqry002?PartNo=' + gimKeywords;
	}

	$scope.searchOracleDataWarehouse = function(oracleKeywords) {
		window.location.href = 'http://rpsd.comm.mot.com/oracle_reports/bin/inv_display.asp?tb_material_nb=' + oracleKeywords;
	}

	$scope.searchMsiDotCom = function(msiKeywords) {
		window.location.href = 'http://www.motorolasolutions.com/en_us/search.html?q=' + msiKeywords;
	}

	$scope.searchGoogle = function(googleKeywords) {
		window.location.href = 'https://www.google.com/?gws_rd=ssl#safe=active&q=' + googleKeywords;
	}
}]);