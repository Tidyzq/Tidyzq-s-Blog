'use strict'

Document-detail-controller = (document, $state, $scope, $root-scope, $element, Auth) !->

  vm = @

  $ '.documents-list' .add-class 'split-document-list col-md-4 visible-md-block visible-lg-block'
  $ '.document-detail-content' .add-class 'split-document-detail'

  document
    .$promise
    .then !->
      $root-scope.$broadcast 'config toolbar', do
        parent:
          text: 'Document'
          sref: 'app.documents.main'
        child:
          text: document.title
        buttons:
          * text: 'Edit'
            class: 'btn-info'
            disabled: not Auth.is-admin! and Auth.current-user.id is not document.author.id

  vm.document = document

  $scope.$watch 'vm.document.html', !->
    $element.html vm.document.html

  $scope.$on 'toolbar button clicked', !->
    $state.go 'app.editor', document

angular
  .module \app.document-detail
  .controller 'DocumentDetailController', Document-detail-controller