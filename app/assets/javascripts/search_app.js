var app = angular.module("search", ["ngRoute", "templates"]);

// Routes
app.config(["$routeProvider", function($routeProvider) {

	$routeProvider
		.when("/", {
			controller: "DashboardController",
			templateUrl: "dashboard.html"
		})
		.when("/product", {
			controller: "ProductController",
			templateUrl: "product.html"
		})
		.when("/company", {
			controller: "CompanyController",
			templateUrl: "company.html"
		})
		.when("/agent", {
			controller: "AgentController",
			templateUrl: "agent.html"
		})
		.when("/portal", {
			controller: "PortalController",
			templateUrl: "portal.html"
		})
		.when("/facility", {
			controller: "FacilityController",
			templateUrl: "facility.html"
		})
		.otherwise({
			redirectTo: "/"
		});
}]);

// Param Service: Pass params to another route
app.factory("paramService", ["$location", function($location) {
	return {
		search: function(item, keywords) {
			$location.path("/" + item).search({ "keywords": keywords });
		}
	}
}]);

// Product Service: Get products from data source
app.factory("productService", ["$http", function($http) {
	
	// Implementation
	function getProductList(keywords) {
		var promise = $http.get("/api/v1/products.json", { "params": { "keywords": keywords } }
		).success(
			function(data, status, headers, config) {
				return data;
		}).error(
			function(data, status, headers, config) {
				return status;
		});
		return promise;
	}
	function getProductDetail(id) {
		var promise = $http.get("/api/v1/products/" + id + ".json"
		).success(
			function(data, status, headers, config) {
				return data;
			}
		).error(
			function(data, status, headers, config) {
				return status;
			}
		);
		return promise;
	}

	// Interface
	return {
		productList: function(keywords) {
			return getProductList(keywords);
		},
		productDetail: function(id) {
			return getProductDetail(id);
		}
	}
}]);

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