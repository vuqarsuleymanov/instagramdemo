package com.instagramdemo

import org.springframework.web.multipart.MultipartFile

class NewsFeedService {

    def burningImageService
    def springSecurityService

    def savePhoto(params, file, webrootDir) {
        def user = springSecurityService.currentUser
        String[] extension = file?.fileItem?.fileName.split("[.]")
        String name = UUID.randomUUID().toString()+"."+extension[extension.length - 1];
        File fileDest = new File(webrootDir,"upload/"+name)
        File cropDest = new File(webrootDir, "upload")
        file.transferTo(fileDest)
        burningImageService.doWith(fileDest.getAbsolutePath(), cropDest.getAbsolutePath()+"/images").execute { it.scaleAccurate(500, 500) }
        def feed = new NewsFeed()
        feed.user = user
        feed.photoPath = cropDest.getAbsolutePath()+File.separator+"images"+File.separator
        feed.photoName = name
        feed.status = 1
        feed.effect = params.effect
        feed.save(flush: true)
    }

    def removeFeed(params){
        def user = springSecurityService.currentUser
        def feed = NewsFeed.findByUserAndId(user, params.getLong('id'))
        if(feed){
            feed.status = 0
            feed.save(flush: true)
        }
    }

    def addComment(params){
        def user = springSecurityService.currentUser
        def feed = NewsFeed.get(params.getLong('id'))
        def comment
        if(feed){
            comment = new Comments()
            comment.comment = params.comment
            comment.newsFeed = feed
            comment.user = user
            comment.save(flush: true)

        }
        return comment
    }

    def likeFeed(params){
        def user = springSecurityService.currentUser
        def feed = NewsFeed.get(params.getLong('id'))
        if(feed){
            def like = Likes.findByUserAndNewsFeed(user, feed)
            if(like)
                like.delete(flush: true)
            else{
                like = new Likes()
                like.user = user
                like.newsFeed = feed
                like.save(flush: true)
            }
            return like
        }
    }
}
