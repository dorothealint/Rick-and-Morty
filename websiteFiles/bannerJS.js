window.addEventListener('DOMContentLoaded',init,false);
            
function init() {
    alert('The page loaded!');
}

document.getElementsByClassName("p-for-banner").addEventListener("mouseover", mouseOver);

function mouseOver() {
    document.getElementsByClassName("p-for-banner").style.color = "red";
}
