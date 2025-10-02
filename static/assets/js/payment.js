// <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

function payment(cost, mobile, email, formdata) {

    // var customer_info = {{ request.session.customer_info|safe }};
    // alert(paymentmethod);

    // e.preventDefault();
    var amount = cost * 100;
    // var amount = 1000
    // console.log(amount)

    // alert(amount)
    // alert(typeof  amount)
    var options = {
        "key": "rzp_test_dRWiKHS7zr2Gki",
        "amount": amount,
        "name": "Demo",
        "description": "",
        "currency": "INR",
        "image": "",
        "handler": function (response) {
            if (response.razorpay_payment_id === "") {
                alert('Failed');
            } else {
                sendCartData(formdata)
            }
        },
        "notes": {
            "address": ""
        },
        "theme": {
            "color": "#050505"
        },
    };
    var rzp1 = new Razorpay(options);
    rzp1.open();
}


function sendCartData(formdata) {
    fetch('/ConfirmOrder', {
        'method': 'POST',
        'body': formdata
    }).then(res => res.text()).then(data => {
        if (data === 'success') {

            getCartEntries()
            window.location.href = '/orderSuccess'
        } else {
            swal({
                title: "Payment failed",
                text: "Please try again later",
                icon: "warning",
            })
        }
    })
}