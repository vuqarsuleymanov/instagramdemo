package com.instagramdemo

class SharedController {

    def springSecurityService

    def top(){
        def user = springSecurityService.currentUser
        [user: user]
    }

    def footer(){

    }

    def index() {}
}
