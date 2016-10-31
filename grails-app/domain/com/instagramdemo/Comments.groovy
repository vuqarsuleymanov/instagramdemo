package com.instagramdemo

class Comments {

    String comment
    Date dateCreated

    static belongsTo = [newsFeed: NewsFeed, user: User]

    static constraints = {
        comment nullable: false, blank: false,maxSize:300
		
    }

    static mapping = {
        comment type: "text"
    }
}
