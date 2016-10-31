package com.instagramdemo

class Likes {


    static belongsTo = [newsFeed: NewsFeed, user: User]

    static constraints = {
    }
}
