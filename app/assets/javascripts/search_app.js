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