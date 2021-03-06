'use strict'

config.$inject = [\$stateProvider,\SidebarMenuProvider ]
function config  ( $state-provider, Sidebar-menu-provider )
  $state-provider
    .state 'app.users', do
        url: '/users',

        views:
          'content':
            template-url: 'console/main/users/users.template.html'
            controller: 'UsersController as vm'

        resolve:
          data: [\User (User) ->
            User
              .find do
                filter:
                  include: 'roles'
          ]

        on-enter: [\Toolbar (Toolbar) ->
          Toolbar.config do
            parent:
              text: 'User'
              sref: 'app.users'
            buttons:
              * text: 'Add User'
                class: 'btn-success'
                sref: 'app.add-user'
        ]


  Sidebar-menu-provider.save-item 'content', do
    name: 'Content'
    is-group: true

  Sidebar-menu-provider.save-item 'content.users', do
    name: 'User'
    sref: 'app.users'
    icon: 'fui-user'
    require-admin: true

  return

angular
  .module 'app.users', []
  .config config
