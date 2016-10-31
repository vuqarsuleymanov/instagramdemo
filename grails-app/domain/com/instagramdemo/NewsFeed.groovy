package com.instagramdemo

class NewsFeed {

    String photoPath
    String photoName
    Date dateCreated
    String effect
    int status

    static belongsTo = [user: User]

    static hasMany = [comments: Comments, likes: Likes]

    static constraints = {
        photoName nullable: false, blank: false
        photoPath nullable: false, blank: false
    }

}
