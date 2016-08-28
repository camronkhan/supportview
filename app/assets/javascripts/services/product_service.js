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