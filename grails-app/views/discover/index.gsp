<%@ page import="com.instagramdemo.Followers" %>
<meta name="layout" content="main"/>
<link rel="stylesheet" href="${resource(dir: "css", file: "explore.css")}"/>
<link rel="stylesheet" href="${resource(dir: "css", file: "cssgram.min.css")}"/>
<main class="_6ltyr _rnpza" role="main">
<div align="center">
    <div class="_oyz6j" style="width: 600px" align="center">  

        <ul class="_769lo _4j13h"><li class="_cx1ua"><h2 class="_bgfey">Discover People</h2></li>
            <g:each in="${users}" var="user">
                <li class="_cx1ua">
                    <div class="_ikcuh">
                        <div class="_6jvgy">
                            <div class="_9tu8m">
                                <a class="_5lote _pfo25 _vbtk2"  style="width: 30px; height: 30px;">
                                    <g:if test="${user?.photo}">
                                        <img class="_a012k" src="/upload/images/${user?.photo?.toLowerCase()}">
                                    </g:if>
                                    <g:else>
                                        <img class="_a012k" src="${resource(dir:"images", file: "avatar.jpg")}">
                                    </g:else>

                                </a>
                                <div class="_mmgca">
                                    <div class="_gzjax"><g:link controller="profile" action="index" id="${user?.id}" class="_4zhc5 notranslate _j7lfh" href="javascript:void(0)">${user?.username}</g:link></div>
                                    <div class="_2uju6">${user?.fullname}</div>
                                </div>
                            </div>
                            <div class="_72gdz"><span class="_e616g">
                                <g:form controller="profile" action="follow" class="follow-ajax-form" id="${user?.id}">
                                    <button id="follow-${user?.id}" class="_aj7mu _2hpcs _95tat _o0442">
                                        <g:if test="${com.instagramdemo.Followers.findByFollowerAndUser(currentUser, user)}">Following</g:if><g:else>Follow</g:else>
                                    </button>
                                </g:form>
                            </span></div>
                        </div>
                        <div class="_ev1ab">
                            <g:each in="${user?.newsFeed?.findAll {it.status == 1}}" var="feed">
                                <div class="_pbwg8">
                                    <div class="_22yr2 _s3j6d">
                                        <div class="_jjzlb" ><img class="_icyx7 ${feed?.effect}" style="position: absolute" src="/upload/images/${feed?.photoName?.toLowerCase()}"></div>
                                        <!-- react-empty: 3517 -->
                                        <div class="_ovg3g"></div>
                                    </div>
                                </div>
                            </g:each>
                        </div>
                    </div>
                </li>
            </g:each>
        </ul>
    </div>
</main>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
<g:javascript src="jquery.form.min.js"/>
<script>
    $(function(){
        var options = {
            success:       success  // post-submit callback
        };

        $(".follow-ajax-form").ajaxForm(options)

        function success(response, statusText, xhr, $form){
            console.log(response)
            if($("#follow-"+response.user.id).text()==="Following") {
                $("#follow-" + response.user.id).text("Follow")
            }else{
                $("#follow-" + response.user.id).text("Following")
            }
        }
    });
</script>