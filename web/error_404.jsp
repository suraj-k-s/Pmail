<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title> Error 404 </title>
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
        <link href='https://fonts.googleapis.com/css?family=Anton|Passion+One|PT+Sans+Caption' rel='stylesheet' type='text/css'>
        <style>
            * {
                font-family: "PT Sans Caption", sans-serif, "arial", "Times New Roman";
            }
            .error .clip .shadow {
                height: 180px;
            }
            .error .clip:nth-of-type(2) .shadow {
                width: 130px;
            }
            .error .clip:nth-of-type(1) .shadow,
            .error .clip:nth-of-type(3) .shadow {
                width: 250px;
            }
            .error .digit {
                width: 150px;
                height: 150px;
                line-height: 150px;
                font-size: 120px;
                font-weight: bold;
            }
            .error h2 {
                font-size: 32px;
            }
            .error .errorPage {
                margin-top: 10%;
                position: relative;
                height: 250px;
                padding-top: 40px;
            }
            .error .errorPage .clip {
                display: inline-block;
                transform: skew(-45deg);
            }
            .error .clip .shadow {
                overflow: hidden;
            }
            .error .clip:nth-of-type(2) .shadow {
                overflow: hidden;
                position: relative;
                box-shadow: inset 20px 0px 20px -15px rgba(150, 150, 150, 0.8),
                    20px 0px 20px -15px rgba(150, 150, 150, 0.8);
            }

            .error .clip:nth-of-type(3) .shadow:after,
            .error .clip:nth-of-type(1) .shadow:after {
                content: "";
                position: absolute;
                right: -8px;
                bottom: 0px;
                z-index: 9999;
                height: 100%;
                width: 10px;
                background: linear-gradient(
                    90deg,
                    transparent,
                    rgba(173, 173, 173, 0.8),
                    transparent
                    );
                border-radius: 50%;
            }
            .error .clip:nth-of-type(3) .shadow:after {
                left: -8px;
            }
            .error .digit {
                position: relative;
                top: 8%;
                color: white;
                background: #ff3f3f;
                border-radius: 50%;
                display: inline-block;
                transform: skew(45deg);
            }
            .error .clip:nth-of-type(2) .digit {
                left: -10%;
            }
            .error .clip:nth-of-type(1) .digit {
                right: -20%;
            }
            .error .clip:nth-of-type(3) .digit {
                left: -20%;
            }
            .error h2 {
                color: #a2a2a2;
                font-weight: bold;
                padding-bottom: 20px;
            }

            @media (max-width: 767px) {
                .error .clip .shadow {
                    height: 100px;
                }
                .error .clip:nth-of-type(2) .shadow {
                    width: 80px;
                }
                .error .clip:nth-of-type(1) .shadow,
                .error .clip:nth-of-type(3) .shadow {
                    width: 100px;
                }
                .error .digit {
                    width: 80px;
                    height: 80px;
                    line-height: 80px;
                    font-size: 52px;
                }
                .error h2 {
                    font-size: 24px;
                }

                .error .errorPage {
                    height: 150px;
                }
            }

        </style>
    </head>

    <body>

        <div class="error">
            <div class="container-floud">
                <div class="col-xs-12 ground-color text-center">
                    <div class="errorPage">
                        <div class="clip">
                            <div class="shadow"><span class="digit numberThree"></span></div>
                        </div>
                        <div class="clip">
                            <div class="shadow"><span class="digit numberTwo"></span></div>
                        </div>
                        <div class="clip">
                            <div class="shadow"><span class="digit numberOne"></span></div>
                        </div>
                    </div>
                    <h2>Oops ! Page not found<br />That's an error</h2>
                </div>
            </div>
        </div>

        <script >
            function randomNum() {
                "use strict";
                return Math.floor(Math.random() * 9) + 1;
            }
            var loop1,
                    loop2,
                    loop3,
                    time = 30,
                    i = 0,
                    number,
                    selector3 = document.querySelector(".numberThree"),
                    selector2 = document.querySelector(".numberTwo"),
                    selector1 = document.querySelector(".numberOne");
            loop3 = setInterval(function() {
                "use strict";
                if (i > 40) {
                    clearInterval(loop3);
                    selector3.textContent = 4;
                } else {
                    selector3.textContent = randomNum();
                    i++;
                }
            }, time);
            loop2 = setInterval(function() {
                "use strict";
                if (i > 80) {
                    clearInterval(loop2);
                    selector2.textContent = 0;
                } else {
                    selector2.textContent = randomNum();
                    i++;
                }
            }, time);
            loop1 = setInterval(function() {
                "use strict";
                if (i > 100) {
                    clearInterval(loop1);
                    selector1.textContent = 4;
                } else {
                    selector1.textContent = randomNum();
                    i++;
                }
            }, time);

        </script>

    </body>

</html>