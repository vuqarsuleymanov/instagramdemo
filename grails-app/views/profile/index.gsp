<meta name="layout" content="main" />

<link rel="stylesheet" href="${resource(dir: "css", file: "profile.css")}"/>
<main class="_6ltyr _rnpza" role="main">
    <article class="_42elc _sey0k">
        <header class="_5axto">
            <div class="_8gpiy _r43r5" style="margin-left: 4%; margin-right: 4%">
                <button class="_jzgri" title="Change profile photo">
                    <g:if test="${user?.photo}">
                        <img <g:if test="${user?.id == currentUser?.id}"> id="img"</g:if> alt="Change profile photo" class="_g5pg0" src="/upload/images/${user?.photo?.toLowerCase()}">
                    </g:if>
                    <g:else>
                        <img <g:if test="${user?.id == currentUser?.id}"> id="img"</g:if> alt="Change profile photo" class="_g5pg0" src="${resource(dir: "images", file: "avatar.jpg")}">
                    </g:else>


                </button>
                <g:uploadForm controller="profile" action="changePhoto">
                    <input id="file" type="file" name="img" accept="image/*" class="_loq3v">
                </g:uploadForm>
            </div>
        </div>
            <div class="_de9bg"><div class="_8mm5v"><h1 class="_i572c notranslate" title="${user?.username}">${user?.username}</h1>

    </div>
        <ul class="_9o0bc _o8dd8">
            <li class="_218yx"><span class="_s53mj"><!-- react-text: 960 --><!-- /react-text --><span class="_bkw5z">${user?.newsFeed?.size()}</span>
                <!-- react-text: 962 -->posts
                <!-- /react-text -->
            </span>
            </li>
            <li class="_218yx">
                <a class="_s53mj" href="javascript:void(0)">
                    <!-- react-text: 965 -->
                    <!-- /react-text --><span class="_bkw5z" title="93">${user?.followers?.count {it.user == user}}</span>
                    <!-- react-text: 967 -->followers
                    <!-- /react-text -->
                </a>
            </li>
            <li class="_218yx">
                <a class="_s53mj" href="javascript:void(0)">
                    <!-- react-text: 970 -->
                    <!-- /react-text --><span class="_bkw5z">${user?.followers?.count {it.follower == user}}</span>
                    <!-- react-text: 972 -->following
                    <!-- /react-text -->
                </a>
            </li>
        </ul>
                <g:if test="${user?.id != currentUser?.id}">
    <g:form controller="profile" action="follow" class="follow-ajax-form" id="${user?.id}">
                <button style="width: 200px;" id="follow-${user?.id}" class="_aj7mu _2hpcs _95tat _o0442">
                    <g:if test="${com.instagramdemo.Followers.findByFollowerAndUser(currentUser, user)}">Unfollow</g:if><g:else>Follow</g:else>
                </button>
    </g:form>
                </g:if>
    </div>
    </header>
        <div>
            <div class="_nljxa">

                    <g:set var="current" value="${0}"/>
                    <g:each in="${feeds}" var="feed" status="i">
                        <g:if test="${current % 3 == 0}">
                            <div class="_myci9">
                        </g:if>
                        <a class="_8mlbc _vbtk2 _t5r8b" href="javascript:void(0)" style="max-width: 293px; max-height: 293px;">
                            <div class="_22yr2" style="max-width: 293px; max-height: 293px;">
                                <div class="_jjzlb" style="max-width: 293px; max-height: 293px;"><img class="_icyx7 ${feed?.effect}" id="pImage_11" style="max-width: 293px; max-height: 293px;"  src="/upload/images/${feed?.photoName?.toLowerCase()}"></div>
                                <!-- react-empty: 987 -->
                                <div class="_ovg3g"></div>
                            </div>
                        </a>
                        <g:set var="current" value="${current+1}"/>
                        <g:if test="${current % 3 == 0 && current > 0}">
                            </div>
                            <g:set var="current" value="${0}"/>
                        </g:if>
                    </g:each>

            </div>

        </div>
    </article>
</main>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
<g:javascript src="jquery.form.min.js" />
<script>
    $(function(){
        $("#img").click(function(){
            $("#file").click();
        });
        $("#file").change(function(){
            $("form").submit();
        });
    });
</script>
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