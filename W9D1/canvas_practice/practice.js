document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    const ctx = canvas.getContext('2d');
    ctx.fillStyle = "green";
    ctx.fillRect(20, 10, 150, 100);

    ctx.beginPath();
    ctx.arc(300, 75, 50, 0, 2 * Math.PI);
    ctx.strokeStyle = "blue";
    ctx.lineWidth = 3;
    ctx.stroke();
    ctx.fillStyle = "black";
    ctx.fill();
});
