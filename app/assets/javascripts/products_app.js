var app = angular.module(
	"products",
	[
		"ngRoute"
	]
);

app.controller("ProductSearchController", [
			"$scope", "$http",
	function($scope ,  $http) {

		// Initialize products array
		$scope.products = [];
		
		$scope.search = function(searchTerm) {
			
			// Display loading message
			$scope.loading = true;

			// Set minimum character length to process requests
			if (searchTerm.length < 3) {
				return;
			}

			// Send GET request to server
			$http.get("/products.json",
						{ "params": { "keywords": searchTerm } }
			).success(
				function(data, status, headers, config) {
					$scope.products = data;
					$scope.loading = false;
			}).error(
				function(data, status, headers, config) {
					$scope.loading = false;
					alert("There was a problem: " + status);
			});
		}
	}
]);