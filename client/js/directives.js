'use strict';

/* Directives */

var schoolparadeDirectives = angular.module('schoolparadeDirectives', []);

schoolparadeDirectives.directive('ngResult', function () {
    return {
        restrict: 'E',
        replace: true,
        scope: {
            stdid: '@',
            student: '@',
            examid: '@'
        },
        template: '<form  method="post" style="display:inline;">'

        + '<input type="hidden" ng-model="studentResult.id" name="id"  value="{{stdid}}" />'

        + '<input type="text" class="input-inline" ng-disabled="false" ng-model="studentResult.Mat" ng-blur="submitResult(\'Mat\',studentResult.Mat)"/>'

        + '<input type="text" class="input-inline" ng-disabled="false" ng-model="studentResult.Eng" ng-blur="submitResult(\'Eng\',studentResult.Eng)"  >'

        + '<input type="text" class="input-inline" ng-disabled="false" ng-model="studentResult.Kis" ng-blur="submitResult(\'Kis\',studentResult.Kis)" />'

        + ' <input type="text" class="input-inline" ng-disabled="false" ng-model="studentResult.Che" ng-blur="submitResult(\'Che\',studentResult.Che)" />'

        + '<input type="text" class="input-inline"  ng-disabled="false" ng-model="studentResult.Phy" ng-blur="submitResult(\'Phy\',studentResult.Phy)" />'

        + ' <input type="text" class="input-inline" ng-disabled="false" ng-model="studentResult.Bio" ng-blur="submitResult(\'Bio\',studentResult.Bio)" />'

        + ' <input type="text" class="input-inline" ng-disabled="false" ng-model="studentResult.Hag" ng-blur="submitResult(\'Hag\',studentResult.Hag)" />'

        + ' <input type="text" class="input-inline" ng-disabled="false" ng-model="studentResult.Geg" ng-blur="submitResult(\'Geg\',studentResult.Geg)" />'

        + '  <input type="text" class="input-inline" ng-disabled="false" ng-model="studentResult.Cre" ng-blur="submitResult(\'Cre\',studentResult.Cre)" />'

        + '  <input type="text" class="input-inline" ng-disabled="false" ng-model="studentResult.Fre" ng-blur="submitResult(\'Fre\',studentResult.Fre)" />'

        + '  <input type="text" class="input-inline" ng-disabled="false" ng-model="studentResult.Hsc" ng-blur="submitResult(\'Hsc\',studentResult.Hsc)" />'

        + '<input type="text"  class="input-inline" ng-disabled="false" ng-model="studentResult.Bst" ng-blur="submitResult(\'Bst\',studentResult.Bst)" />' + '</form>',

        controller: ['$scope', 'Api', '$http',
                function ($scope, Api, $http) {
                $scope.studentResult = JSON.parse($scope.student);
                // $scope.exam_id=exam_id;
                $scope.studentResult.exam_id = $scope.examid;
                $scope.studentResult.id = $scope.stdid;
                $scope.submitResult = function (newKey, mark) {
                    var student = new Object();
                    student.id = $scope.stdid;
                    student.exam_id = $scope.examid;
                    student[newKey] = mark;
                    console.log(student);
                    $http({
                        method: 'POST',
                        url: 'http://localhost/school_parade/api/teacher/submit_result/',
                        data: student, // pass in data as strings
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        } //so angular passing info (not request payload)
                    })
                        .success(function (data) {
                            console.log(data);
                            if (data['success'] == 'true') {
                                //Send Indicator

                                console.log("Got response");

                            } else {
                                console.log("Got no response");
                            }
                        });

                }
    }],
        link: function (scope, attr, elem) {
            console.log(scope.examid);
            console.log(scope.studentResult.examid);
        }
    }
});