compare-to = ->
  require: "ngModel"
  scope:
    otherModelValue: "=compareTo"
  link: (scope, element, attributes, ngModel) !->

    ngModel.$validators.compareTo = (modelValue) ->
      modelValue == scope.otherModelValue

    scope.$watch "otherModelValue", !->
        ngModel.$validate!


angular
  .module 'app'
  .directive 'compareTo', compare-to