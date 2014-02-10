'use strict';

var schoolparadeServices=angular.module('schoolparadeServices', ['ngResource']);

schoolparadeServices.factory('Api', ['$resource','appSettings',
                                      function($resource,appSettings) {
                                            return {                                                 
                                                    appData: $resource(appSettings.SCHOOL_API+'/:appObj/:method/:id1/:id2', 
                                                            {appObj:'teacher',method:'@method',id1:'@id1',id2:'@id2'},
                                                            {  
                                                              query: {method:'GET', params: {method:'@method',id1:'@id1'},isArray:true },
                                getClassResult:{method:'GET',params:{method:'@method',id1:'@id1',id2:'@id2'},isArray:true},
                                                                signIn:{method:'POST',params:{method:'sign_in'}},
                                                                save:{method:'POST',params:{method:'sign_in'}}
                                                            }
                                                        )                                                    
                                            };
                                    }]);


schoolparadeServices.service('editNewService',function()
{
    $scope.newResult={};
    
    $scope.submitForm=function()
    {
        console.log("called");
         $http({
                     method  : 'POST',
                     url     : 'http://localhost/school_parade/api/teacher/submit_result/',
                     data    :  $scope.newResult,  // pass in data as strings
                     headers : { 'Content-Type': 'application/x-www-form-urlencoded' }//Prevent request payload)
                    })
                    .success(function(data) 
                    {
                        console.log(data);
                        if (data['success']=='true')
                        {                
                            //Send Indicator
                            
                            console.log("Got response");
                                         
                        } 
                        else
                        {
                            console.log("Got no response");                       
                        }
                    });            
    }
});



schoolparadeServices.service('SharedData',function()
{
    this.resultData={};
    
    this.resultDat=function()
    {
        return this.resultData;
    }
    
    this.setClassId=function(id)
    {
        this.resultData.classId=id;
       
    }
    
    this.getClassId=function(){
        return this.resultData.classId;
    } 
    
    this.setFormName=function(name)
    {
         this.resultData.form=name;
    }    
    this.getFormName=function()
    {
        return this.resultData.form;
    }     
    this.setExamId=function(id)
    {
        this.resultData.examId=id;
    }    
    this.getExamId=function()
    {
        return this.resultData.examId;
    }
    this.getExam=function()
    {
        return this.resultData.exam;
    }
    this.setExam=function(exam)
    {
        this.resultData.exam=exam;
    }
        
    this.setViewMode=function(mode)
    {
        this.resultData.viewMode=mode;
    }
    
    this.getViewMode=function()
    {
        return this.resultData.viewMode;
    }
    
});