// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
angular.module('starter', ['ionic'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if(window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
})
.controller("MapController",function ($scope,$ionicLoading) {
    var myCenter=new google.maps.LatLng(51.508742,-0.120850);
    function initialize () {
      // alert("ini");
      var mapProp ={
        center: myCenter,
        zoom: 6,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(document.getElementById('googleMaps'),mapProp );
      
      $scope.map2 = map;
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
          $scope.$apply(function() {
            var pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };
          $scope.gloPos = pos;
          var marker=new google.maps.Marker({
            position:pos,
            animation:google.maps.Animation.BOUNCE
          });
          marker.setMap($scope.map2);
          
          var infowindow = new google.maps.InfoWindow({
               content:"Your Location"
          });
          infowindow.open($scope.map2,marker);
          $scope.map2.setCenter(pos);
          });
        }, function() {
          handleLocationError(true, infoWindow, $scope.map2.getCenter());
        });
      } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, $scope.map2.getCenter());
      }
    }
    google.maps.event.addDomListener(window, 'load', initialize);
    $scope.routeIt = function () {
      // body...
      var directionService = new google.maps.DirectionsService;
      var directionDisplay = new google.maps.DirectionsRenderer;
      directionDisplay.setMap($scope.map2)
      calculateAndDisplayRoute(directionService, directionDisplay);
    }

    function  calculateAndDisplayRoute (directionsService, directionsDisplay) {
      // body...
      directionsService.route({
        origin: $scope.gloPos.lat+","+$scope.gloPos.lng,
        destination: "30.061908,31.242866",
        travelMode: google.maps.TravelMode.WALKING,
        // alternatives: true
      },function (response, status) {
        if (status === google.maps.DirectionsStatus.OK) {
          directionsDisplay.setDirections(response);
        } else {
          window.alert('Directions request failed due to ' + status);
        }
      });
    }
})