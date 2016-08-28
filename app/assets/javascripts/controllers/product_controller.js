// Product Controller
app.controller("ProductController", ["$scope", "$location", "productService", function($scope, $location, productService) {

	// Store list of products from JSON service
	$scope.products = [];
	$scope.test = [];

	// Store selected product
	$scope.selectedProduct = null;
	
	// Main search function
	$scope.search = function(keywords) {
		
		// Display loading message
		$scope.loading = true;

		// Set minimum character length to process requests
		if (keywords.length < 3) {
			return;
		}

		// Load a product's detail view
		$scope.loadDetails = function() {
			productService.productDetail($scope.selectedProduct.id)
				.then(
					// On success
					function(response) {
						$scope.product = response.data;
					},
					// On failure
					function(response) {
						alert("There was a problem: " + response.status);
					}
				);
		}

		// Load the selected product's detail view
		$scope.selectProduct = function(product) {
			$scope.selectedProduct = product;
			$scope.loadDetails();
		}

		// Load the master list of products
		$scope.loadList = function(keywords) {
			productService.productList(keywords)
				.then(
					// On success
					function(response) {
						$scope.products = response.data;

						if ($scope.products.length > 0) {
							//$scope.products = productService.products(keywords);
							$scope.loading = false;

							// If more than one product is returned, select first by default
							$scope.selectedProduct = $scope.products[0];

							// Load product details
							$scope.loadDetails();
						}
					},
					// On failure
					function(response) {
						alert("There was a problem: " + response.status);
					}
				);
		};
		$scope.loadList(keywords);
	}

	// On initizlize, run search if query params are present
	this.$onInit = function() {
		if ($location.search().keywords) {
			$scope.search($location.search().keywords);
		}
	}
	this.$onInit();
}]);