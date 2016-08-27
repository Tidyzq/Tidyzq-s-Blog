'use strict'

config = ($state-provider, Sidebar-menu-provider) !->
  $state-provider
    .state 'app.tags', do
      url: '/tags'
      views:
        'content':
          template-url: 'main/tags/tags.template.html'
          controller: 'TagsController as vm'
      resolve:
        tags: (Tag) ->
          Tag
            .find do
              filter:
                include:
                  relation: 'documents'
                  scope:
                    fields:
                      id: true

    .state 'app.tags.main', do
      url: '/'
      on-enter: ($root-scope, Toolbar) !->

        # $ '.documents-list' .remove-class 'split-document-list col-md-4 visible-md-block visible-lg-block'
        # $ '.document-detail-content' .remove-class 'split-document-detail'

        Toolbar.config do
          parent:
            text: 'Tags'
            sref: 'app.tags.main'
          buttons:
            * text: 'Add tag'
              class: 'btn-success'
              sref: 'app.add-tag'

  Sidebar-menu-provider.save-item 'content.tags', do
    name: 'Tag'
    sref: 'app.tags.main'
    icon: 'fui-tag'
    weight: 1

angular
  .module 'app.tags', []
  .config config