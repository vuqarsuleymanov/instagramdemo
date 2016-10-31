<meta name="layout" content="main"/>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
<link href="${resource(dir: "css", file: "cssgram.min.css")}" rel="stylesheet" />
<style>
.navbuttons {
    display: inline-block;
    overflow: auto;
    overflow-y: hidden;

    max-width: 100%;
    margin: 0 0 1em;

    white-space: nowrap;
}

.navbuttons li {
    display: inline-block;
    vertical-align: top;
    cursor: pointer;
}
</style>
<g:javascript src="nude.min.js" />

<g:javascript src="noworker.nude.min.js" />
<g:javascript src="worker.nude.min.js" />
<script>
    $(function(){
        $("#photo-div").click(function(){
            $("#file").click();
        });

        $("#file").change(function(){
            $("#photo-div").hide();
            readURL(this);
            $('#show-img').show();
            $(".scroll").show();
            $("#btn-post").show();

        });

        $(".navbuttons li").click(function(){
            $("#show-img").attr("class", $(this).attr("id"))
            $("#filter").val($(this).attr("id"))
        });

        $("#btn-post").click(function(){

            $("form").submit();

        });



        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#show-img').attr('src', e.target.result);

                    for(i=0; i<=23; i++){
                        $("#"+i).attr('src', e.target.result);
                    }
                }

                reader.readAsDataURL(input.files[0]);
            }
        }


    })
</script>
<main class="_6ltyr _rnpza" role="main">
    <section class="_jx516">
        <div class="_qj7yb"><div>
            <article class="_8ab8k _j5hrx _pieko" style="text-align: center" >
                <g:if test="${flash.error}">
                    <h4 style="color: red">${flash.error}</h4>
                </g:if>
                <button id="photo-div" class="_n4m46"><span class="_p1u2e _ldozo coreSpriteAddPhoto"><span class="_32wir"></span></span><!-- react-text: 10 -->Add a photo<!-- /react-text --></button>
                <div id="filter-div">
                <img style="display: none; width: 100%;" src="" id="show-img" />
                <div class="scroll" style="margin-top: 10px;display: none;">
                <ul class="navbuttons">
                    <li id="normal">
                        <img src="" id="0" style="height: 100px;" class="normal" />
                        <br/>
                        normal
                    </li>
                    <li id="_1977">
                        <img src="" id="1" style="height: 100px;" class="_1977" />
                        <br/>
                        1977
                    </li>
                    <li id="aden">
                        <img src="" id="2" style="height: 100px;" class="aden" />
                        <br/>
                        aden
                    </li>
                    <li id="brannan">
                        <img src="" id="3" style="height: 100px;" class="brannan" />
                        <br/>
                        brannan
                    </li>
                    <li id="brooklyn">
                        <img src="" id="4" style="height: 100px;" class="brooklyn" />
                        <br/>
                        brooklyn
                    </li>
                    <li id="clarendon">
                        <img src="" id="5" style="height: 100px;" class="clarendon" />
                        <br/>
                        clarendon
                    </li>
                    <li id="earlybird">
                        <img src="" id="6" style="height: 100px;" class="earlybird" />
                        <br/>
                        earlybird
                    </li>
                    <li id="gingham">
                        <img src="" id="7" style="height: 100px;" class="gingham" />\
                        <br/>
                        gingham
                    </li>
                    <li id="hudson">
                        <img src="" id="8" style="height: 100px;" class="hudson" />
                        <br/>
                        hudson
                    </li>
                    <li id="inkwell">
                        <img src="" id="9" style="height: 100px;" class="inkwell" />
                        <br/>
                        inkwell
                    </li>
                    <li id="lark">
                        <img src="" id="10" style="height: 100px;" class="lark" />
                        <br/>
                        lark
                    </li>
                    <li id="lofi">
                        <img src="" id="11" style="height: 100px;" class="lofi" />
                        <br/>
                        lofi
                    </li>
                    <li id="mayfair">
                        <img src="" id="12" style="height: 100px;" class="mayfair" />
                        <br/>
                        mayfair
                    </li>
                    <li id="moon">
                        <img src="" id="13" style="height: 100px;" class="moon" />
                        <br/>
                        moon
                    </li>
                    <li id="nashville">
                        <img src="" id="14" style="height: 100px;" class="nashville" />
                        <br/>
                        nashville
                    </li>
                    <li id="perpetua">
                        <img src="" id="15" style="height: 100px;" class="perpetua" />
                        <br/>
                        perpetua
                    </li>
                    <li id="reyes">
                        <img src="" id="16" style="height: 100px;" class="reyes" />
                        <br/>
                        reyes
                    </li>
                    <li id="rise">
                        <img src="" id="17" style="height: 100px;" class="rise" />
                        <br/>
                        rise
                    </li>
                    <li id="slumber">
                        <img src="" id="18" style="height: 100px;" class="slumber" />
                        <br/>
                        slumber
                    </li>
                    <li id="toaster">
                        <img src="" id="19" style="height: 100px;" class="toaster" />
                        <br/>
                        toaster
                    </li>
                    <li id="valencia">
                        <img src="" id="20" style="height: 100px;" class="valencia" />
                        <br/>
                        valencia
                    </li>
                    <li id="walden">
                        <img src="" id="21" style="height: 100px;" class="walden" />
                        <br/>
                        walden
                    </li>
                    <li id="willow">
                        <img src="" id="22" style="height: 100px;" class="willow" />
                        <br/>
                        willow
                    </li>
                    <li id="xpro2">
                        <img src="" id="23" style="height: 100px;" class="xpro2" />
                        <br/>
                        xpro2
                    </li>
                </ul>
                </div>
                </div>
                <g:uploadForm controller="newsFeed" action="savePhoto">
                    <input type="file" accept="image/*" name="file" style="display: none;" id="file"/>
                    <input type="hidden" id="filter" name="effect" />
                    <a href="javascript: void(0)" id="btn-post" style="float: right; display: none; margin: 20px;" >Post</a>
                </g:uploadForm>
            </article>
        </div></div>
    </section>
</main>