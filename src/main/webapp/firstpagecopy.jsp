<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />

</head>

<body>
<script src="https://w.soundcloud.com/player/api.js" type="text/javascript"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://www.zellerda.com/themes/main/js/tokenize/jquery.tokenize.js"></script>
<script src="//connect.soundcloud.com/sdk.js"></script>
<script src="<%=request.getContextPath()%>/js/progressbar.min.js"></script>

<h1>Поисковый сервис EDM</h1>
<div class="fluid">
    <div class="span1">
            <select
                    id="tokenize_focus"
                    class="tokenize-sample"
                    multiple="multiple"
                    name="select"
                    style="margin: 0px; padding: 0px; border: 0px; display: none;">
                <option value="Ambient">Ambient</option>
                <option value="Bass">Bass</option>
                <option value="Breakbeat">Breakbeat</option>
                <option value="Bass House">Bass House</option>
                <option value="Bass Music">Bass Music</option>
                <option value="Breakbeats">Breakbeats</option>
                <option value="Break">Break</option>
                <option value="Beat">Beat</option>
                <option value="Big Room">Big Room</option>
                <option value="Booty">Booty</option>
                <option value="Bounce">Bounce</option>
                <option value="Chill">Chill</option>
                <option value="Chill Trap">Chill Trap</option>
                <option value="Chillout">Chillout</option>
                <option value="ChillStep">ChillStep</option>
                <option value="Chill Music">Chill Music</option>
                <option value="Dubstep">Dubstep</option>
                <option value="Drumstep">Drumstep</option>
                <option value="Dance">Dance</option>
                <option value="Dancehall">Dancehall</option>
                <option value="Deep">Deep</option>
                <option value="DrumNBass">DrumNBass</option>
                <option value="Drum&Bass">Drum&Bass</option>
                <option value="DnB">DnB</option>
                <option value="Drum & Bass">Drum & Bass</option>
                <option value="Drum and Bass">Drum and Bass</option>
                <option value="Drum">Drum</option>
                <option value="Deep House">Deep House</option>
                <option value="Indie Dance">Indie Dance</option>
                <option value="Electronic">Electronic</option>
                <!--<option value="Experimental Trap">Experimental Trap</option>-->
                <option value="Electro">Electro</option>
                <option value="Electro House">Electro House</option>
                <option value="Future">Future</option>
                <option value="Festival Trap">Festival Trap</option>
                <option value="Glitch Hop">Glitch Hop</option>
                <option value="Jungle">Jungle</option>
                <option value="Jungle Terror">Jungle Terror</option>
                <option value="Hybrid">Hybrid</option>
                <option value="Hybrid Trap">Hybrid Trap</option>
                <option value="House">House</option>
                <option value="Hip">Hip</option>
                <option value="Hop">Hop</option>
                <option value="Trap">Trap</option>
                <option value="Twerk">Twerk</option>
                <option value="Trance">Trance</option>
                <option value="Trapstep">Trapstep</option>
                <option value="Trapmusic">Trapmusic</option>
                <option value="Trapsounds">Trapsounds</option>
                <option value="Tech House">Tech House</option>
                <option value="Tropical">Tropical</option>
                <option value="Tropical House">Tropical House</option>
                <option value="Techstep">Techstep</option>
                <option value="TWRK">TWRK</option>
                <option value="Trapstyle">Trapstyle</option>
                <option value="Tech Trance">Tech Trance</option>
                <option value="Tech">Tech</option>
                <option value="Midtempo">Midtempo</option>
                <option value="Melodic Dubstep">Melodic Dubstep</option>
                <option value="MidTempo">MidTempo</option>
                <option value="Melodic">Melodic</option>
                <option value="Melbourne">Melbourne</option>
                <option value="Melbourne Bounce">Melbourne Bounce</option>
                <option value="Nu Disco">Nu Disco</option>
                <option value="Neurotrap">Neurotrap</option>
                <option value="Neurofunk">Neurofunk</option>
                <option value="Neuro">Neuro</option>
                <option value="NeuroHop">NeuroHop</option>
                <option value="Liquid">Liquid</option>
                <option value="Progressive Trance">Progressive Trance</option>
                <option value="Progressive">Progressive</option>
                <option value="Progressive House">Progressive House</option>
                <!--<option value="RAVE-HOP" selected="selected">Rave-Hop</option>-->
                <option value="Step">Step</option>
                <option value="Uplifting Trance">Uplifting Trance</option>
                <option value="Uplifting">Uplifting</option>
                <option value="808">808</option>
            </select>
            <button class="button-search" >SEARCH</button>
    </div>
</div>
<div id="textBar">
<div id="progBar" style="width: 25%">
</div>
    <h2 id="textIn">OF MUSICAL DRIVE!</h2>
</div>
<div id="scWidgetContainer">
</div>
<div class="parent-btn">
    <div class="nav-button">
        <button id="prevPage" class="button-orange">Prev Page</button>
        <button id="nextPage" class="button-orange">Next Page</button>
    </div>
</div>
<script>
    SC.initialize({
        client_id: '575c74bdca3d893d9603ae06e69f22e5'
    });

    var iframetop = '<iframe id="sc-widget';
    var iframebottom = '" width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url="> <\/iframe>';
    var page_size = 5;
    var currentPage = 0;
    var bLimit = false;


    function gogo(taglist, offset) {

        SC.get('/tracks', {
            limit: page_size,
            offset: offset,
            tags: taglist,
            bpm: { from: 120 }
        }, function(tracks) {
            bLimit = true;
            for (var i = 0; i < tracks.length; i++) {
                $(scWidgetContainer).append(iframetop + i + iframebottom);
                letsbegin(tracks[i].uri, i, tracks.length);
            }

        });
    };

    function letsbegin(newSoundUrl,i,length) {
        if (i == 1) {
            fofirst()
        }
        var widgetIframe = document.getElementById('sc-widget' + i),
                widget = SC.Widget(widgetIframe);
        widget.load(newSoundUrl, {
            show_artwork: true
        });

        widget.bind(SC.Widget.Events.READY, function() {

            widget.bind(SC.Widget.Events.FINISH, function() {
                if (i < length - 1) {
                    var widgetIframe2 = document.getElementById('sc-widget' + (i +1));
                    SC.Widget(widgetIframe2).play();
                } else {
                    nextPage();
                }
            });
        });
    }

    function fofirst() {
        var widgetIframe3 = document.getElementById('sc-widget' + 0),
                widgett = SC.Widget(widgetIframe3);
        widgett.bind(SC.Widget.Events.READY, function() {
            widgett.play();
        });
    }

    function btnsrch() {



        var offset = 0;
        arrhandle(offset);

    }

    function arrhandle(offset) {
        $(scWidgetContainer).empty();
        $(".parent-btn").css('display', 'inline-block');
        var arr = $('select#tokenize_focus').tokenize().toArray();
        var taglist = arr.toString();



        var element = document.getElementById('progBar');
        $("#progBar").empty();

        $.post('search', {
            "taglist" : taglist }, function(responseText) {

            var circle = new ProgressBar.Circle(element, {
                color: '#aaa',
                // This has to be the same size as the maximum width to
                // prevent clipping
                strokeWidth: 10,
                trailWidth: 1,
                easing: 'easeInOut',
                duration: 1000,
                text: {
                    value: '0'
                },

                from: { color: '#D32F2F', width: 1 },
                to: { color: '#4CAF50', width: 10 },
                // Set default step function for all animate calls
                step: function(state, circle) {
                    circle.path.setAttribute('stroke', state.color);
                    circle.path.setAttribute('stroke-width', state.width);
                    circle.setText((circle.value() * 100).toFixed(0) + '%');
                    circle.text.setAttribute('color', state.color);
                }
            });

            circle.animate(responseText);
            $(".progressbar-text").css('font-size', '40px');


            gogo(taglist, offset);

        }).fail(function() {
            alert("Цвет не существует");
        });

    }

    function prevPage() {
        if ( (currentPage - 1) < 0) return;
        bLimit = false;
        currentPage--;
        var offset = currentPage * page_size;
        arrhandle(offset);
    }

    function nextPage() {
        currentPage++;
        var offset = currentPage * page_size;
        arrhandle(offset);
    }

    $(document).ready(function () {
        var offset = 0;
        $('select#tokenize_focus').tokenize({
            displayDropdownOnFocus:true,
            placeholder: "click or type here!",
            onAddToken: function(value,text,e){
                console.log("MY  LOG CHANGE");
                console.log("MY  LOG value " + value);
                console.log("MY  LOG text " + text);
                console.log("MY  LOG eeee " + e);
            }
        });

        $(".button-search").click(btnsrch);


        /*
        $("select[name=select]:selected").change(function () {
            console.log("MY  LOG CHANGE");
            //btnsnd();
            btnsrch();
        });
        */
        $("#prevPage").click(prevPage);
        $("#nextPage").click(nextPage);
    });

</script>

<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-69226913-1', 'auto');
    ga('send', 'pageview');

</script>
</body>
</html>
