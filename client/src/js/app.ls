'use strict'
angular
  .module \app <[ lbServices ui.router ]>
  .config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) !->

    $stateProvider
      .state \todo {
        url: ''
        templateUrl: 'views/todo.html'
        controller: 'TodoController'
      }

    $urlRouterProvider .otherwise \todo
  ]
