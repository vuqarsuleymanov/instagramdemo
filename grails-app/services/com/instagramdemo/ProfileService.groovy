package com.instagramdemo

class ProfileService {

    def springSecurityService
    def burningImageService

    def changePhoto(file, webrootDir) {
        User user = springSecurityService.currentUser
        String[] extension = file?.fileItem?.fileName.split("[.]")
        String name = UUID.randomUUID().toString()+"."+extension[extension.length - 1];
        File fileDest = new File(webrootDir,"upload/"+name)
        File cropDest = new File(webrootDir, "upload")
        file.transferTo(fileDest)
        burningImageService.doWith(fileDest.getAbsolutePath(), cropDest.getAbsolutePath()+"/images").execute { it.scaleAccurate(500, 500) }
        user.photo = name
        user.save(flush: true)
    }

    def follow(params){
        def user = springSecurityService.currentUser
        def follow = User.get(params.getLong('id'))
        Followers followers = Followers.findByUserAndFollower(follow, user)
        if(!followers && follow){
            followers = new Followers()
            followers.follower = user
            followers.user = follow
            followers.save(flush: true)
        }else if(followers){
            followers.delete(flush: true)
        }
        return followers
    }
}
