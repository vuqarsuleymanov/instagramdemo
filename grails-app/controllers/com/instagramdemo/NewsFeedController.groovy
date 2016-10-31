package com.instagramdemo

import org.codehaus.groovy.grails.web.metaclass.WithFormMethod;

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.web.servlet.mvc.SynchronizerTokensHolder

class NewsFeedController {

    def springSecurityService
    def newsFeedService

    @Secured(['IS_AUTHENTICATED_FULLY', 'IS_AUTHENTICATED_REMEMBERED'])
    def index() {
        def user = springSecurityService.currentUser
        def feeds = NewsFeed.findAllByStatus(1, [sort: "dateCreated", order: "desc",max:200])
        [feeds: feeds, user: user]
    }

    @Secured(['IS_AUTHENTICATED_FULLY', 'IS_AUTHENTICATED_REMEMBERED'])
    def addPhoto(params){

    }

    @Secured(['IS_AUTHENTICATED_FULLY', 'IS_AUTHENTICATED_REMEMBERED'])
    def savePhoto(params){

        def file = request.getFile("file")
        String[] extension = file?.fileItem?.fileName.split("[.]")
        String format = extension[extension.length-1].toLowerCase()
        if(format.equals("jpg") || format.equals("jpeg") || format.equals("png")){
            def webrootDir = servletContext.getRealPath("/") //app directory
            newsFeedService.savePhoto(params, file, webrootDir)
            redirect(action: "index")
        }else{
            flash.error = "Please select jpg, jpeg or png images"
            redirect(action: "addPhoto")
        }

    }

    @Secured(['IS_AUTHENTICATED_FULLY', 'IS_AUTHENTICATED_REMEMBERED'])
    def removeFeed(params){
        newsFeedService.removeFeed(params)
        redirect(action: "index")
    }
	
	
	public static boolean isAjax(request) {
		return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	}

    @Secured(['IS_AUTHENTICATED_FULLY', 'IS_AUTHENTICATED_REMEMBERED'])
    def addComment(params){

            if (isAjax (request)){
                if(params.comment){
                    def comment = newsFeedService.addComment(params)
                    if(comment){
                        def json = [:]
                        json.comment = comment?.comment
                        json.username = comment?.user?.username
                        json.userid  = comment?.user?.id
                        json.feedid = comment?.newsFeed?.id
                        json.id = comment?.id
                        render json as JSON
                    }
                }

            }



    }

    @Secured(['IS_AUTHENTICATED_FULLY', 'IS_AUTHENTICATED_REMEMBERED'])
    def likeFeed(params){
        def like = newsFeedService.likeFeed(params)
        if(like)
            render like as JSON
    }


}
