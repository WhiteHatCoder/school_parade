'use strict';

/* App Module */

var schoolsparadeApp = angular.module('schoolsparadeApp', [
  'ngRoute',
  'ngSanitize',

  'webStorageModule',
  'schoolparadeServices',
  'schoolparadeDirectives',
  'schoolsparadeControllers',
  
],function($httpProvider)
{
    //Emulate use of normal JQuery way of handling form data as x-www-form/application overriding application/json
  // Use x-www-form-urlencoded Content-Type
  $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
 
  // Override $http service's default transformRequest
  $httpProvider.defaults.transformRequest = [function(data)
  {
    /**
     * The workhorse; converts an object to x-www-form-urlencoded serialization.
     * @param {Object} obj
     * @return {String}
     */ 
    var param = function(obj)
    {
      var query = '';
      var name, value, fullSubName, subName, subValue, innerObj, i;
      
      for(name in obj)
      {
        value = obj[name];
        
        if(value instanceof Array)
        {
          for(i=0; i<value.length; ++i)
          {
            subValue = value[i];
            fullSubName = name + '[' + i + ']';
            innerObj = {};
            innerObj[fullSubName] = subValue;
            query += param(innerObj) + '&';
          }
        }
        else if(value instanceof Object)
        {
          for(subName in value)
          {
            subValue = value[subName];
            fullSubName = name + '[' + subName + ']';
            innerObj = {};
            innerObj[fullSubName] = subValue;
            query += param(innerObj) + '&';
          }
        }
        else if(value !== undefined && value !== null)
        {
          query += encodeURIComponent(name) + '=' + encodeURIComponent(value) + '&';
        }
      }
      
      return query.length ? query.substr(0, query.length - 1) : query;
    };
    
    return angular.isObject(data) && String(data) !== '[object File]' ? param(data) : data;
  }];
});
    
    
    
//Defines App constants
schoolsparadeApp.constant('appSettings',{
    'BASE_URL':'http://localhost/school_parade/',
    'SCHOOL_API':'http://localhost/school_parade/api' 
});
    
    
   
schoolsparadeApp.config(['$provide','$routeProvider', function($provide,$routeProvider) {
    
    $provide.decorator('ngModelDirective', function($delegate) {
        var ngModel = $delegate[0], controller = ngModel.controller;
        ngModel.controller = ['$scope', '$element', '$attrs', '$injector', function(scope, element, attrs, $injector) {
            var $interpolate = $injector.get('$interpolate');
            attrs.$set('name', $interpolate(attrs.name || '')(scope));
            $injector.invoke(controller, this, {
                '$scope': scope,
                '$element': element,
                '$attrs': attrs
            });
        }];
        return $delegate;
    });

    $provide.decorator('formDirective', function($delegate) {
        var form = $delegate[0], controller = form.controller;
        form.controller = ['$scope', '$element', '$attrs', '$injector', function(scope, element, attrs, $injector) {
            var $interpolate = $injector.get('$interpolate');
            attrs.$set('name', $interpolate(attrs.name || attrs.ngForm || '')(scope));
            $injector.invoke(controller, this, {
                '$scope': scope,
                '$element': element,
                '$attrs': attrs
            });
        }];
        return $delegate;
    });

  $routeProvider.
      when('/', {
        templateUrl: 'client/partials/dashboard.html',
        controller:'ResultListCtrl'
      }).
      when('/login', {
        templateUrl: 'client/partials/login.html',
        
      }).
      when('/logout', {
        templateUrl: 'client/partials/login.html',
        controller: 'LogoutCtrl'
      }).
      when('/timeout', {
        templateUrl: 'client/partials/login.html',
        controller: 'SessionCtrl'
      }).
      when('/results-list', {
        templateUrl: 'client/partials/results-list.html',
        controller: 'ResultListCtrl'
      }).
      when('/class-result', {
        templateUrl: 'client/partials/class-result.html',
        controller: 'ResultCtrl'
      }).
      when('/create-result', {
        templateUrl: 'client/partials/new-class-result.html',
        controller:'createNewResultSetCtrl'
      }).
      when('/report/ExamId', {
        templateUrl: 'client/partials/exam-report.html',
        controller: 'ResultCtrl'
      }).
      when('/report/ClassId', {
        templateUrl: 'client/partials/student-report.html',
        controller: 'ResultCtrl'
      }).      
      otherwise({
        redirectTo: '/'
      });
    
        //Restangular Settings
   // RestangularProvider.setBaseUrl('http://localhost/school_parade/api');
    //RestangularProvider.setDefaultRequestParams({ apiKey: '4f847ad3e4b08a2eed5f3b54' })



  }]).
run( function($rootScope, $location) {
 
    // register listener to watch route changes
    $rootScope.$on( "$routeChangeStart", function(event, next, current) {
      if ( $rootScope.loggedin == false ) {
        // no logged user, we should be going to #login
        if ( next.templateUrl == "partials/login.html" ) {
          // already going to #login, no redirect needed
        } else {
          // not going to #login, we should redirect now
          $location.path( "/login" );
        }
      }        
    });
 });


                  /* config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/', {
        templateUrl: 'client/partials/dashboard.html',
        controller:'ResultListCtrl'
      }).
      when('/login', {
        templateUrl: 'client/partials/login.html',
        
      }).
      when('/logout', {
        templateUrl: 'client/partials/login.html',
        controller: 'LogoutCtrl'
      }).
      when('/timeout', {
        templateUrl: 'client/partials/login.html',
        controller: 'SessionCtrl'
      }).
      when('/results-list', {
        templateUrl: 'client/partials/results-list.html',
        controller: 'ResultListCtrl'
      }).
      when('/class-result', {
        templateUrl: 'client/partials/class-result.html',
        controller: 'ResultCtrl'
      }).
      when('/create-result', {
        templateUrl: 'client/partials/new-class-result.html',
        controller:'createNewResultSetCtrl'
      }).
      when('/report/ExamId', {
        templateUrl: 'client/partials/exam-report.html',
        controller: 'ResultCtrl'
      }).
      when('/report/ClassId', {
        templateUrl: 'client/partials/student-report.html',
        controller: 'ResultCtrl'
      }).      
      otherwise({
        redirectTo: '/'
      });
  }]).
run( function($rootScope, $location) {
 
    // register listener to watch route changes
    $rootScope.$on( "$routeChangeStart", function(event, next, current) {
      if ( $rootScope.loggedin == false ) {
        // no logged user, we should be going to #login
        if ( next.templateUrl == "partials/login.html" ) {
          // already going to #login, no redirect needed
        } else {
          // not going to #login, we should redirect now
          $location.path( "/login" );
        }
      }        
    });
 });

*/