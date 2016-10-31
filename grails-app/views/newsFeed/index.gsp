<meta name="layout" content="main" />
<link href="${resource(dir: "css", file: "cssgram.min.css")}" rel="stylesheet" />
<main class="_6ltyr _rnpza" role="main">
    <section class="_jx516">
        <div class="_qj7yb"><div>
            <g:each in="${feeds}" var="feed">
                <article class="_8ab8k _j5hrx _pieko">
                    <header class="_s6yvg">
                <g:link controller="profile" action="index" id="${feed?.user?.id}" class="_5lote _pss4f _vbtk2" style="width: 30px; height: 30px;">
                            <g:if test="${feed?.user?.photo}">
                                <img  class="_a012k" src="/upload/images/${feed?.user?.photo?.toLowerCase()}">
                            </g:if>
                            <g:else>
                                <img  class="_a012k" src="${resource(dir: "images", file: "avatar.jpg")}">
                            </g:else>
                        </g:link>
                        <div class="_f95g7">
                            <g:link controller="profile" action="index" id="${feed?.user?.id}" class="_4zhc5 notranslate _ook48" >${feed?.user?.username}</g:link>
                        </div>
                        <a class="_ljyfo" href="#">
                            <time class="_379kp" datetime="2016-10-19T13:00:44.000Z" title="Oct 19, 2016"><g:formatDate date="${feed?.dateCreated}" format="dd, MMM HH:mm"/> </time>
                        </a>
                    </header>
                    <div>
                        <div class="_22yr2 _e0mru">
                            <div class="_jjzlb">
                                <img alt="#portraitsfromtheworld" style="position: absolute; width: 100%" class="${feed?.effect}"  src="upload/images/${feed?.photoName?.toLowerCase()}">
                            </div><!-- react-empty: 19 -->
                            <div class="_ovg3g"></div>
                        </div>
                    </div>
                    <div class="_es1du _rgrbt">
                        <section class="_tfkbw _hpiil">
                            <div class="_iuf51 _oajsw">
                                <span class="_tf9x3"><!-- react-text: 27 --><!-- /react-text -->
                                    <span>${feed?.likes?.size()}</span>
                                    likes
                                </span>
                            </div>
                        </section>
                        <ul class="_mo9iw _pnraw" id="comments-${feed?.id}">
                            <g:each in="${feed?.comments?.sort{ a,b -> b.dateCreated <=> a.dateCreated} }" var="comment">
                                <li class="_nk46a">
                                    <g:link class="_4zhc5 notranslate _iqaka" controller="profile" action="index" id="${comment?.user?.id}">${comment?.user?.username}</g:link>
                                    <span>${comment?.comment}</span>
                                </li>
                            </g:each>
                        </ul>
                        <section class="_jveic _dsvln">
                            <a class="_ebwb5 _1tv0k like" id="like-${feed?.id}" href="javascript:void(0)" role="button" aria-disabled="false">
                                <g:if test="${com.instagramdemo.Likes.findByNewsFeedAndUser(feed, user)}">
                                    <span class="_soakw coreSpriteHeartFull">Unlike</span>
                                </g:if>
                                <g:else>
                                    <span class="_soakw coreSpriteHeartOpen">Like</span>
                                </g:else>
                            </a>

                            <g:form  controller="newsFeed" action="addComment" id="${feed?.id}" class="_k3t69 comment-ajax-form comments-ajax-form-${feed?.id}" useToken="true">
                                <input type="text" name="comment" class="_7uiwk _qy55y comment-input" aria-label="Add a comment…" placeholder="Add a comment…" value="">
                            </g:form>
                            <g:if test="${feed?.user?.id == user?.id}">
                            <g:form useToken="true" controller="newsFeed" action="removeFeed" id="${feed?.id}">
                                <button  class="remove-feed _9q0pi coreSpriteEllipsis _soakw">Delete</button>
                            </g:form>
                            </g:if>
                        </section>
                    </div>
                </article>
            </g:each>
        </div>

        </div>
    </section>
</main>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
<g:javascript src="jquery.form.min.js"/>
<script>
    $(function(){
        $(".remove-feed").click(function(){
            return confirm("Are you sure?")
        });

        var options = {
            success:       success,  // post-submit callback,
            error: error
        };

        $(".comment-input").keyup(function(event){
            if(event.keyCode == 13) {

                    $(".comment-input").attr("disabled", true);

            }
        });

        $(".comment-ajax-form").ajaxForm(options);

        function success(responseText, statusText, xhr, $form)  {
            console.log(responseText)
            $(".comment-input").val("");
            $("#comments-"+responseText.feedid).append('<li class="_nk46a"><a class="_4zhc5 notranslate _iqaka" href="">'+responseText.username+'</a><span>'+responseText.comment+'</span></li>')
            $(".comment-input").removeAttr("disabled");
        }
        function error(){
            $(".comment-input").removeAttr("disabled");
        }

        setInterval(function(){ $(".comment-input").removeAttr("disabled"); }, 2000);

        $(".like").click(function(){
            var id = $(this).attr("id").split("-")[1]
            $.ajax({
                url: "${createLink(controller: "newsFeed" , action: "likeFeed")}",
                data: {
                    id: id
                },
                success: function(response){
                    if($("#like-"+id).children("span").hasClass("coreSpriteHeartFull")){
                        $("#like-"+id).children("span").removeClass("coreSpriteHeartFull")
                        $("#like-"+id).children("span").addClass("coreSpriteHeartOpen")
                    }else{
                        $("#like-"+id).children("span").removeClass("coreSpriteHeartOpen")
                        $("#like-"+id).children("span").addClass("coreSpriteHeartFull")
                    }
                },
                error: function(error){

                }
            })
        })
    })
</script>