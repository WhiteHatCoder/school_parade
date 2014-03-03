'use strict';

/* Controllers */

var schoolsparadeControllers = angular.module('schoolsparadeControllers', []);
/*****Default login Controller for all users ***/
schoolsparadeControllers.controller('signInCtrl', ['$scope', 'Api', 'webStorage', '$http', '$location', '$rootScope', 'appSettings',
    function ($scope, Api, webStorage, $http, $location, $rootScope, appSettings)
    {
        $scope.user = {};
        $scope.signIn = function () {
            console.log($.param($scope.user));
            $http({
                method: 'POST',
                url: appSettings.SCHOOL_API + '/teacher/login/',
                data: $scope.user, // pass in data as strings
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                } //so angular passing info (not request payload)
            })
                .success(function (data) {
                    if (data['success'] == 'teacher') {
                        //$window.sessionStorage.dataUs=data['data'];
                        webStorage.add("userData", data);
                        $rootScope.loggedin = true;
                        $location.path("/");
                        //Redirect to                
                    } else {
                        webStorage.add("userData", data)
                        console.log(data);
                        $scope.loggedin = false;
                    }
                });
        }
}]);
/********************************Saving new data class result *******************/
schoolsparadeControllers.controller('createNewResultSetCtrl', ['$scope', 'Api', 'webStorage', '$http', '$location', '$rootScope',
    function ($scope, Api, webStorage, $http, $location, $rootScope, editNewService)
    {

        /*   var checkExamExistence=function()
    {
        Api.appData.query({method:'get_class_list',id1:'1'});
    }
    */

        //Check existence of exam within the list
        //If true redirect to result set
        //If false create a new one  and display the sheet

        //Enter the class from session
        //Enter the Exam from School Db Drop Down
        //Populate all students from this school teacher, class,year
        //Input class list into results table ready for updates
        //Prepare the sheet with input controls with subjects as 
        $scope.classList = Api.appData.query({
            method: 'get_class_list',
            id1: '1'
        });
        //On click of save get all the forms within it 
        //Increment on each 
        //Append directive to each
        //Fire save 

        /* 
    var get exams=function(){
    }
    */



}]);
/*******Teacher controller for controlling teachers data available after login***/
schoolsparadeControllers.controller('tchCtrl', ['$scope', 'Api',
    function ($scope, Api)
    {

}]);

/********ResultList controller for listing results that exists for current teacher from the classes taught***/
schoolsparadeControllers.controller('ResultListCtrl', ['$scope', 'Api', 'SharedData', 'webStorage',
    function ($scope, Api, SharedData, webStorage)
    {
        $scope.updateResultParam = function (classId, examId, viewMode, className, exam) {
            SharedData.setClassId(classId);
            SharedData.setFormName(className);
            SharedData.setExamId(examId);
            SharedData.setViewMode(viewMode);
            SharedData.setExam(exam);
        }

        var returnedData = webStorage.get('userData');
        var teacherData = new Object();
        teacherData.id = returnedData.data[0].id;
        teacherData.name = returnedData.data[0].teacher_name;
        teacherData.schId = returnedData.data[0].sch_id;
        teacherData.role = returnedData.data[0].role;
        teacherData.clases = returnedData.data[0].classes; //Array of classes

        //Get all Classes taught
        angular.forEach(returnedData.data[0].classes, function (data) {
            //Get classes and assign to teacherObject;
        })
        //Get all Subjects Taught
        console.log(teacherData);


        //console.log(returnedData.data[0]);
        var classesTaught = returnedData.data[0].classes;
        //var  teacherSch=teacher_data.data[0].sch
        //Get all results list associated with this teacher
        $scope.classes = Api.appData.query({
            method: 'get_all_class_taught',id1:teacherData.schId
        });
        //Get all results in excel format
        $scope.downloadExcel = function (classId, examId) {
            Api.appData.query({
                method: 'get_class_result_excel',
                id1: classId,
                id2: examId
            });
        }
        //Get class results in pdf format

        //Filter results

        //detemine whether to show class result or subject result





}]);


/********Result controller for fetching results data from the server based on the data updated by the resultListCtrl***/
schoolsparadeControllers.controller('ResultCtrl', ['$scope', 'Api', 'SharedData', 'webStorage',
    function ($scope, Api, SharedData, webStorage)
    {



        $scope.loginData = webStorage.get(name);
        //console.log(webStorage.get(userData));
        console.log($scope.loginData);

        ///There is an issue when page is reloaded all data is lost .Handle by maintaining current class id and exam id on webstorage
        //or redirect to result list
        $scope.classAvg = new Object();
        $scope.classResultName = SharedData.getFormName() + '-' + SharedData.getExam() + ' results';
        $scope.exam_id = 1;
        if (SharedData.getClassId() && SharedData.getExamId) {
            $scope.exam_id = SharedData.getExamId();
            $scope.results = Api.appData.getClassResult({
                    method: 'get_class_result',
                    id1: SharedData.getClassId(),
                    id2: $scope.exam_id
                },
                function success(result) {
                    $scope.classResults = Array();
                    compileResult(result);

                });
        } else {
            console.log("No data passed to this controller");
        }

        $scope.mode = "report";

        $scope.switchMode = function () {
            if ($scope.mode == "report") {
                $scope.mode = "edit";
            } else {
                $scope.mode = "report";
            }

        }


        $scope.newResult = {};

        $scope.submitForm = function () {
            console.log("called");
            $http({
                method: 'POST',
                url: 'http://localhost/school_parade/api/teacher/submit_result/',
                data: $scope.newResult, // pass in data as strings
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                } //Prevent request payload)
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









        /*******************************************
         * Private Methods used across this controller
         ********************************************/
        function compileResult(result) {
            var totalStds = 0;
            var subTotalScore = 0;
            angular.forEach(result, function (stdResult, key) {
                var total = 0;
                var mean = 0;
                var noSub = 0;
                var student = new Object();

                angular.forEach(stdResult, function (value, key) {
                    student[key] = value;
                    if (!isNaN(parseInt(value))) {
                        total = total + parseInt(value);
                        student[key + 'grade'] = computeGrade(parseInt(value));
                        //console.log(computeGrade(value));  
                        //stdResult.push("Grade:"+grade);
                        noSub++;
                    }
                }, this);
                student.total = total;
                student.avg = Math.round(total / noSub);
                student.grade = computeGrade(Math.round((total / noSub)));
                $scope.classResults.push(student);
                subTotalScore += total;
                student = new Object(); //Reset the object

                //mean=total/noSub; 
                //stdResult.push("Mean:"+mean); 
                //stdResult.push("total:"+total); 
                totalStds++;
            }, this);

            function computeGrade(marks) {
                //Dependent on school grading system//Grading system should be passed into this function
                if (marks >= 80) {
                    return 'A';
                } else if (marks >= 75 && marks < 80) {
                    return 'A-';
                } else if (marks >= 70 && marks < 75) {
                    return 'B+';
                } else if (marks >= 65 && marks < 70) {
                    return 'B';
                } else if (marks >= 60 && marks < 65) {
                    return 'B-';
                } else if (marks >= 55 && marks < 60) {
                    return 'C+';
                } else if (marks >= 50 && marks < 55) {
                    return 'C';
                } else if (marks >= 45 && marks < 50) {
                    return 'C-';
                } else if (marks >= 40 && marks < 45) {
                    return 'D+';
                } else if (marks >= 35 && marks < 40) {
                    return 'D-';
                } else if (marks >= 30 && marks < 35) {
                    return 'D';
                } else if (marks < 30) {
                    return 'E';
                }
            }


            function computeTotals() {}

            function computeMean() {}

        }

}]);



schoolsparadeControllers.controller('createResultCtrl', ['$scope',
    function ($scope)
    {
        $scope.hideonEditResult = 'hidden';
        $scope.defaultMode = 'hidden';
        $scope.reportMode = 'hidden';
        $scope.editMode = 'hidden';

        //Activate Commands
        $scope.createMode = '';
}]);

schoolsparadeControllers.controller('SchoolDetailCtrl', ['$scope', '$routeParams', '$http',
  function ($scope, $routeParams, $http)
    {
        $http.get('schools/' + $routeParams.schoolId + '.json').success(function (data) {
            $scope.school = data;
        });
  }]);

function computeTotalByRow() {
    //Bind Data to ng-models
}

function computeTotalByCol() {
    //Bind Data to ng-models

}

function computerClassWorkLoad() {}

function lockColumns() {
    //Dependencies i.e Webstorage data

}

function submitResults() {
    //If committed do not refresh Data

}

function showDynamicResult() {
    //Define mechanism for showing new results that another teacher has loaded
    //Need to keep state of data 
    //Think through the use of triggers and how they can be used n this scenario
}

function generateSchoolAbrv() {

}

function generateExcelFile() {
    //Dependent on server
    //Only returns true 

}

function generatePdfFile() {
    //Dependent on server

}


function emailResult() {
    //Depend on server
}

function sendResultToPrinter() {}

/***
    The system should also offer customised school emails .e xxxx@schoolparade.com
    The system should display teacher who are teaching specific subjects based on a teacher results view
    The system should offer messaging functionalities i,e teacher to teacher based on a subject
***/
schoolsparadeControllers.controller('editResult', ['$scope', '$http',
    function ($scope, $http)
    {
        $scope.newResult = {};

        $scope.submitResult = function () {
            $http({
                method: 'POST',
                url: 'http://localhost/school_parade/api/teacher/submit_result/',
                data: $scope.newResult, // pass in data as strings
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

}]);





schoolsparadeControllers.controller('SchoolListCtrl', ['$scope', '$http',
  function SchoolListCtrl($scope, $http)
    {
        $http.get('schools/schools.json').success(function (data) {
            $scope.schools = data;
        });
        $scope.orderProp = 'name';
  }]);


//Destroy the data