package com.instagramdemo

import grails.plugins.springsecurity.Secured

class DiscoverController {

    def springSecurityService

    @Secured(['IS_AUTHENTICATED_FULLY', 'IS_AUTHENTICATED_REMEMBERED'])
    def index() {
        def currentUser = springSecurityService.currentUser
        def users = User.executeQuery("select u from User u order by Rand()", [max: 5])
        users.remove(currentUser)
        [users: users, currentUser: currentUser]
    }
}
