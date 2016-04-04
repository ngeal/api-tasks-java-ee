<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Angular Material style sheet -->
      <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"></head>
        <body ng-app="tasksApp" ng-cloak>
          <div ng-controller="tasksCtrl">
            <md-button class="md-raised" aria-label="description" md-ripple-size="auto" ng-click="load()">Load</md-button>
            <md-toolbar class="md-primary">
              <div class="md-toolbar-tools">
                <h2 class="md-flex">Tasks</h2>
              </div>
            </md-toolbar>
            <md-content>
              <md-list>
                <md-list-item class="md-3-line" ng-repeat="task in tasks">
                  <i class="material-icons">note_add</i>
                  <div class="md-list-item-text" layout="column">
                    <h3>{{task.title}}</h3>
                    <h4>{{task.description}}</h4>
                  </md-list-item>
                </div>
              </md-list-item>
            </md-list>
          </md-content>
        </div>
        <!-- Angular Material requires Angular.js Libraries -->
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-aria.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-messages.min.js"></script>

        <!-- Angular Material Library -->
        <script src="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.js"></script>

        <!-- Your application bootstrap  -->
        <script type="text/javascript">
          var app = angular.module('tasksApp', ['ngMaterial']);
          app.controller('tasksCtrl', function ($scope, $http) {
            $scope.tasks = [];
            $scope.load = function () {
              $http.get('rest/tasks/get').then(function (result) {
                $scope.tasks = result.data;
              });
            }
          });
        </script>
      </body>
    </html>

    <!--
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that can be in foundin the LICENSE file at http://material.angularjs.org/license.
-->
