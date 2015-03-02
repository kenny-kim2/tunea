var menus;
window.onload = function () {
    menus = document.querySelector(".menus");
    var commBtn = document.getElementById("community-btn");
    
    commBtn.addEventListener("mouseover", function () {
        animateTo(menus, "margin-top", -200, 0, 1000, bb);
    });
    commBtn.addEventListener("mouseout", function () {
        animateTo(menus, "margin-top", 0, -200, 1000, bb);
    });

}
function animateTo(target, property, from, to, duration, easing) {
    if (target.style[property] == "")
        if (property == "opacity")
            target.style[property] = form;
        else
            target.style[property] = from + "px";


    var from = parseInt(target.style[property]);
    var to = parseInt(to);

    var start = new Date();

    var id = setInterval(
            function () {
                var timePassed = new Date() - start;
                var progress = timePassed / duration;
                var result = "";

                if (progress > 1)
                    progress = 1;

                if (easing)
                    result = (from + (to - from) * easing(progress));
                else
                    result = (from + (to - from) * progress);

                if (property != "opacity")
                    result += "px";

                target.style[property] = result;
                if (progress == 1)
                    clearInterval(id);
            }, 10);

}

function linear(progress) {
    return progress;
}
function bb(progress) {
    return -1 * Math.pow(progress - 1, 2) + 1;
}
function aa(progress) {
    return Math.pow(progress, 2);
}