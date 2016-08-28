// Param Service: Pass params to another route
app.factory("paramService", ["$location", function($location) {
	return {
		search: function(item, keywords) {
			$location.path("/" + item).search({ "keywords": keywords });
		}
	}
}]);