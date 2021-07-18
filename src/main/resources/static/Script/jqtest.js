function readyFn( jQuery ) {
console.log("OK");
    $('.click_inc').click(function() {
    var a = $(this).closest("div").index();
    x = document.getElementById(`menu_inputid${a}`).innerText;
    p = document.getElementById(`price${a}`).innerText;
    price = p.slice(2, 5);
    num = menu_click_inc(x);
    document.getElementById(`menu_inputid${a}`).innerText = num;
    total = sum(num, price);
    document.getElementById(`total${a}`).val = total;

    //console.log(total)
    console.log(document.getElementById(`total${a}`).val)

    totalsum();



    // console.log(price)
    // console.log(p)
     console.log(a)
    // console.log(x)
})

$('.click_dec').click(function(e) {
    var a = $(e.target).closest("div").index();
    x = document.getElementById(`menu_inputid${a}`).innerText
    num = menu_click_dec(x)
    if (num >= 0) {
        document.getElementById(`menu_inputid${a}`).innerText = num;
        total = sum(num, price);
        document.getElementById(`total${a}`).val = total;
        totalsum();
    } else {
        alert('NO')
    }

})



function totalsum() {
    var total_a = document.getElementById('total0').val;
    var total_b = document.getElementById('total1').val;
    var total_c = document.getElementById('total2').val;
    sum1 = total_a, sum2 = total_b, sum3 = total_c;
    if (sum1 == undefined) {
        sum1 = 0;
    }
    if (sum2 == undefined) {
        sum2 = 0;
    }
    if (sum3 == undefined) {
        sum3 = 0;
    }
    document.getElementById('total').innerHTML = ("<span>Total:</span>" + (sum1 + sum2 + sum3))
}
}
