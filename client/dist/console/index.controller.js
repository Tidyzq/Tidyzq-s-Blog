(function(){"use strict";function t(t,n,e,o){var i,l;i=this,l=function(){return o.isLoaded},t.$watch(l,function(t){t&&(i.logo=o.currentSetting.logo,i.title=o.currentSetting.title)})}t.$inject=["$scope","Auth","User","BlogSetting"],angular.module("blog").controller("IndexController",t)}).call(this);