package com.instagramdemo

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class ProfileController {

    def springSecurityService
    def profileService

    @Secured(['IS_AUTHENTICATED_FULLY', 'IS_AUTHENTICATED_REMEMBERED'])
    def index() {
        def user = User.get(params.getLong('id'))
        if(!user){
            user = springSecurityService.currentUser
        }
        def currentUser = springSecurityService.currentUser
        def feeds = NewsFeed.findAllByStatusAndUser(1, user)
        [feeds: feeds, user: user, currentUser: currentUser]
    }

    @Secured(['IS_AUTHENTICATED_FULLY', 'IS_AUTHENTICATED_REMEMBERED'])
    def changePhoto(params){
        def file = request.getFile('img')
        def webrootDir = servletContext.getRealPath("/") //app directory
        profileService.changePhoto(file, webrootDir)
        redirect(action: "index")
    }

    @Secured(['IS_AUTHENTICATED_FULLY', 'IS_AUTHENTICATED_REMEMBERED'])
    def follow(params){
        def follower = profileService.follow(params)
        if(follower){
            render follower as JSON
        }
    }
}
