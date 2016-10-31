package com.instagramdemo

class Followers {

    User follower

    static belongsTo = [user: User]

    static constraints = {
    }
}
